;
; Lab1.asm
;
; Created: 09/17/2019 12:40:44 PM
; Author : owner
;
.nolist
.include "m328pbdef.inc"
.list

Start:
	LDI		R16, 0x20
	OUT		DDRB, R16

	LDI		R17, 0x00
	
	LDI		R18, 0x80
	OUT		PORTB, R18
	
	LDI		R20, 0x00
	
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% START UP %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
LOOP:
	OUT		PORTB5, R16

	CALL	delay100ms
//////////////////////////////////////////////////////
	IN		R19, PINB
	ANDI	R19, 0x80
	CP		R19, R20
	BREQ	Hz

	OUT		PORTB5, R17

	CALL	delay100ms
////////////////////////////////////////////////////
	IN		R19, PINB
	ANDI	R19, 0x80
	CP		R19, R20
	BREQ	Hz

	RJMP	LOOP
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 1Hz %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Hz:
	OUT		PORTB5, R16

	CALL	delay500ms

//////////////////////////////////////////////////////
	IN		R19, PINB
	ANDI	R19, 0x80
	CP		R19, R20
	BREQ	Five_Hz

	OUT		PORTB5, R17

	CALL	delay500ms

//////////////////////////////////////////////////////
	IN		R19, PINB
	ANDI	R19, 0x80
	CP		R19, R20
	BREQ	Five_Hz

	RJMP Hz

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 5Hz %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Five_Hz:

	

	OUT		PORTB5, R16

	CALL	delay100ms

//////////////////////////////////////////////////////
	IN		R19, PINB
	ANDI	R19, 0x80
	CP		R19, R20
	BREQ	Ten_Hz

	OUT		PORTB5, R17

	CALL	delay100ms

//////////////////////////////////////////////////////
	IN		R19, PINB
	ANDI	R19, 0x80
	CP		R19, R20
	BREQ	Ten_Hz

	RJMP Five_Hz

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 10Hz %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Ten_Hz:

	OUT		PORTB5, R16

	CALL	delay50ms

//////////////////////////////////////////////////////
	IN		R19, PINB
	ANDI	R19, 0x80
	CP		R19, R20
	BREQ	Hz

	OUT		PORTB5, R17

	CALL	delay50ms

//////////////////////////////////////////////////////
	/*IN		R19, PINB
	ANDI	R19, 0x80
	CP		R19, R20
	BREQ	Hz*/

	RJMP Ten_Hz
	




//%%%%%%%%%%%%%%%% 100MS DELAY %%%%%%%%%%%%%%%%%%
delay100ms:                                     
	LDI		R25, 8                               
delay100msA:                                     
	LDI		R26, 0 
delay100msB:
	LDI		R27, 0 
delay100msC:
	DEC		R27 
	BRNE	delay100msC 
	DEC		R26 
	BRNE	delay100msB 
	DEC		R25 
	BRNE	delay100msA
	RET

//%%%%%%%%%%%%%%%% 500MS DELAY %%%%%%%%%%%%%%%%%%
delay500ms: 
	LDI		R25, 40
delay500msA: 
	LDI		R26, 0 
delay500msB:
	LDI		R27, 0 
delay500msC:
	DEC		R27 
	BRNE	delay500msC 
	DEC		R26 
	BRNE	delay500msB 
	DEC		R25 
	BRNE	delay500msA
	RET

//%%%%%%%%%%%%%%%% 50MS DELAY %%%%%%%%%%%%%%%%%%
delay50ms: 
	LDI		R25, 4
delay50msA: 
	LDI		R26, 0 
delay50msB:
	LDI		R27, 0 
delay50msC:
	DEC		R27 
	BRNE	delay50msC 
	DEC		R26 
	BRNE	delay50msB 
	DEC		R25 
	BRNE	delay50msA
	RET

/*Start:		
	LDI		R16,0x1E	
	OUT		DDRB,R16	; LED set up, set bits 4,3,2,1 to output

	LDI		R16,0xF0
	OUT		DDRD,R16	; Sets D7:D0 as output, D3:D0 inputs

	LDI		R16, 0x0F
	OUT		PORTD, R16	; Enabling internal pull-ups on D3:D0
	RJMP	ROW_1

ROW_1:		
	LDI		R16,0x7F
	OUT		PORTD,R16	; Row 1  Call
	NOP
	NOP
	IN		R17,PIND ; READING FROM PIND
	CALL	ROW_1_Check

ROW_2:		
	LDI		R16,0xBF
	OUT		PORTD,R16 ; Row 2 Call
	NOP
	NOP
	IN		R17,PIND ; READING FROM PIND
	CALL	ROW_2_Check

ROW_3:
	LDI		R16,0xDF
	OUT		PORTD,R16 ; Row 3 Calls
	NOP
	NOP
	IN		R17,PIND ; READING FROM PIND
	CALL	ROW_3_Check

ROW_4:		
	LDI		R16,0xEF
	OUT		PORTD,R16 ; Row 4 Calls
	NOP
	NOP
	IN		R17,PIND ; READING FROM PIND
	CALL	ROW_4_Check

ROW_1_Check:
	;1 Press COLOR BLUE
	LDI		R19,0x77
	CP		R17,R19
	BREQ	BLUE

	;2 Press COLOR GREEN
	LDI		R19,0x7B
	CP		R17,R19
	BREQ	GREEN

	;3 Press COLOR CYAN
	LDI		R19,0x7D
	CP		R17,R19
	BREQ	CYAN
	RJMP	ROW_2

ROW_2_Check:
	;4 Press COLOR RED
	LDI		R19,0xB7
	CP		R17, R19
	BREQ	RED
	
	;5 Press color magenta
	LDI		R19,0xBB
	CP		R17,R19
	BREQ	MAGENTA
	
	;6 Press COLOR YELLOW
	LDI		R19, 0xBD
	CP		R17,R19
	BREQ	YELLOW
	RJMP	ROW_3
	
ROW_3_Check:
	;7 Press COLOR WHITE
	LDI		R19, 0xD7
	CP		R17, R19
	BREQ	WHITE
	RJMP	ROW_4
	
ROW_4_Check:
	;0 Press BLACK/ Off
	LDI		R19, 0xEB
	CP		R17, R19
	BREQ	BLACK
	RJMP	ROW_1

BLUE:	
	LDI		R18, 0x1C
	OUT		PORTB, R18
	RJMP	ROW_1

GREEN:	
	LDI		R18, 0x1A
	OUT		PORTB, R18
	RJMP	ROW_1

CYAN:	
	LDI		R18, 0x19
	OUT		PORTB, R18
	RJMP	ROW_1

RED:	
	LDI		R18, 0xB7
	OUT		PORTB, R18
	RJMP	ROW_1

MAGENTA:	
	LDI		R18, 0x14
	OUT		PORTB, R18
	RJMP	ROW_1

YELLOW:	
	LDI		R18, 0x12
	OUT		PORTB, R18
	RJMP	ROW_1

WHITE:	
	LDI		R18, 0x10
	OUT		PORTB, R18
	RJMP	ROW_1

BLACK:	
	LDI		R18, 0x1F
	OUT		PORTB, R18
	RJMP	ROW_1
   */