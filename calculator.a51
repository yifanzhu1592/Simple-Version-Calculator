		ORG		0000H
		LJMP	START
		ORG		1000H
START:
		
MAIN:	LCALL	DISPLAY
		LCALL	KEY2
		LJMP	MAIN
		
KEY2:	LCALL	KS				;È¥¶¶¶¯ÅÐ¶ÏÊÇ·ñ°´¼ü°´ÏÂ
		JNZ		K1
		LCALL	DELAY
		AJMP	KEY2
K1:		LCALL	DELAY
		LCALL	KS
		JNZ		K2
		AJMP	KEY2
K2:		MOV		R2,#11110111B	;µÚ0ÁÐÉ¨ÃèÖµ
		MOV		R6,#0			;µÚ0ÁÐºÅÔÝ´æ£¨ºóÐø¼ÆËã°´¼üºÅ£©
K3:		MOV		P1,R2			;ÏòP1.3Êä³ö0£¬Çý¶¯P1.3ÎªµÍ

L6:		JB		P1.7,L1			;ÅÐ¶Ï0ÐÐµçÆ½£¬P1.7=0£¬Ôò0ÐÐ°´¼ü°´ÏÂ
		MOV		A,#1			;0ÐÐÊ×¼üºÅ
		AJMP	LK				;Ìø×ªµ½¼üºÅ¼ÆËã³ÌÐò
L1:		JB		P1.6,L2			;ÅÐ¶Ï1ÐÐµçÆ½£¬P1.6=0£¬Ôò1ÐÐ°´¼ü°´ÏÂ
		MOV		A,#5			;1ÐÐÊ×¼üºÅ
		AJMP	LK				;Ìø×ªµ½¼üºÅ¼ÆËã³ÌÐò
L2:		JB		P1.5,L3			;ÅÐ¶Ï2ÐÐµçÆ½£¬P1.5=0£¬Ôò2ÐÐ°´¼ü°´ÏÂ
		MOV		A,#9			;2ÐÐÊ×¼üºÅ
		AJMP	LK				;Ìø×ªµ½¼üºÅ¼ÆËã³ÌÐò
L3:		JB		P1.4,NEXT1		;ÅÐ¶Ï3ÐÐµçÆ½£¬P1.4=0£¬Ôò3ÐÐ°´¼ü°´ÏÂ
		MOV		A,#13			;3ÐÐÊ×¼üºÅ
		AJMP	WOO
NEXT1:	
		AJMP	NEXT
WOO:
LK:		ADD		A,R6			;ÐÐÊ×¼üºÅ+ÁÐºÅ=°´¼üºÅ

		MOV		R0,#30H			;#30H´¦µÄÖµÎª0´ú±íÕâ¸öÊäÈë²»ÊÇÒ»¸öÊý×Ö£¬Îª1´ú±íÕâ¸öÊäÈëÊÇÒ»¸öÊý×Ö
		MOV		@R0,#1

		CJNE	A,#10,GO		;½«10×ª»¯Îª0
		MOV		A,#0
GO:		
		CJNE	A,#11,GO1		;ÊäÈëµÄÊÇ+
		MOV		R0,#30H			;ÊäÈëµÄ²»ÊÇÊý×Ö
		MOV		@R0,#0
		MOV		R0,#40H			;#40H´¦µÄÖµÓÃÀ´È·¶¨¼ÆËãµÄ·ûºÅÊÇÄÄ¸ö·ûºÅ
		MOV		@R0,#11
		MOV		R0,#50H			;#50H´¦µÄÖµ»áÓ°ÏìÄÄÐ©µÆ¹ÜÁÁ
		MOV		@R0,#0
		MOV		R7,#1			;½ÓÏÂÀ´ÒªÊäÈëµÄÊÇµÚ¶þ¸öÊý
GO1:
		CJNE	A,#12,GO2		;ÊäÈëµÄÊÇ-
		MOV		R0,#30H
		MOV		@R0,#0
		MOV		R0,#40H
		MOV		@R0,#12
		MOV		R0,#50H
		MOV		@R0,#0
		MOV		R7,#1
GO2:
		CJNE	A,#13,GO3		;ÊäÈëµÄÊÇ*
		MOV		R0,#30H
		MOV		@R0,#0
		MOV		R0,#40H
		MOV		@R0,#13
		MOV		R0,#50H
		MOV		@R0,#0
		MOV		R7,#1
GO3:
		CJNE	A,#14,GO4		;ÊäÈëµÄÊÇ/
		MOV		R0,#30H
		MOV		@R0,#0
		MOV		R0,#40H
		MOV		@R0,#14
		MOV		R0,#50H
		MOV		@R0,#0
		MOV		R7,#1
GO4:
		CJNE	A,#15,GOTO5		;ÊäÈëµÄÊÇ=
		SJMP	GG5
GOTO5:
		LJMP	GO5
GG5:	
		MOV		R7,#0
		MOV		R0,#30H
		MOV		@R0,#0
		
		MOV		R0,#40H
		CJNE	@R0,#11,_11GOTO	;¼Ó·¨
		SJMP	_11_
_11GOTO:
		LJMP	_11
_11_:
		MOV		R0,#38H			;µÚ8Î»
		MOV		A,@R0
		MOV		R3,A
		MOV		R0,#68H
		MOV		A,@R0
		ADD		A,R3
		MOV		R4,A
		SUBB	A,#10			;´óÓÚ10Ê±Ðè½øÎ»
		JC		CARRY1
		MOV		R0,#37H
		INC		@R0
		SJMP	NOCARRY1
CARRY1:	
		MOV		A,R4
NOCARRY1:
		MOV		R0,#88H
		MOV		@R0,A
		
		
		MOV		R0,#37H			;µÚ7Î»
		MOV		A,@R0
		MOV		R3,A
		MOV		R0,#67H
		MOV		A,@R0
		ADD		A,R3
		MOV		R4,A
		SUBB	A,#10
		JC		CARRY2
		MOV		R0,#36H
		INC		@R0
		SJMP	NOCARRY2
CARRY2:	
		MOV		A,R4
NOCARRY2:
		MOV		R0,#87H
		MOV		@R0,A
		
		
		MOV		R0,#36H			;µÚ6Î»
		MOV		A,@R0
		MOV		R3,A
		MOV		R0,#66H
		MOV		A,@R0
		ADD		A,R3
		MOV		R4,A
		SUBB	A,#10
		JC		CARRY3
		MOV		R0,#35H
		INC		@R0
		SJMP	NOCARRY3
CARRY3:	
		MOV		A,R4
NOCARRY3:
		MOV		R0,#86H
		MOV		@R0,A
		
		
		MOV		R0,#35H			;µÚ5Î»
		MOV		A,@R0
		MOV		R3,A
		MOV		R0,#65H
		MOV		A,@R0
		ADD		A,R3
		MOV		R4,A
		SUBB	A,#10
		JC		CARRY4
		MOV		R0,#34H
		INC		@R0
		SJMP	NOCARRY4
CARRY4:	
		MOV		A,R4
NOCARRY4:
		MOV		R0,#85H
		MOV		@R0,A
		
		
		MOV		R0,#34H			;µÚ4Î»
		MOV		A,@R0
		MOV		R3,A
		MOV		R0,#64H
		MOV		A,@R0
		ADD		A,R3
		MOV		R4,A
		SUBB	A,#10
		JC		CARRY5
		MOV		R0,#33H
		INC		@R0
		SJMP	NOCARRY5
CARRY5:	
		MOV		A,R4
NOCARRY5:
		MOV		R0,#84H
		MOV		@R0,A
		
		
		MOV		R0,#33H			;µÚ3Î»
		MOV		A,@R0
		MOV		R3,A
		MOV		R0,#63H
		MOV		A,@R0
		ADD		A,R3
		MOV		R4,A
		SUBB	A,#10
		JC		CARRY6
		MOV		R0,#32H
		INC		@R0
		SJMP	NOCARRY6
CARRY6:	
		MOV		A,R4
NOCARRY6:
		MOV		R0,#83H
		MOV		@R0,A
		
		
		MOV		R0,#32H			;µÚ2Î»
		MOV		A,@R0
		MOV		R3,A
		MOV		R0,#62H
		MOV		A,@R0
		ADD		A,R3
		MOV		R4,A
		SUBB	A,#10
		JC		CARRY7
		MOV		R0,#31H
		INC		@R0
		SJMP	NOCARRY7
CARRY7:	
		MOV		A,R4
NOCARRY7:
		MOV		R0,#82H
		MOV		@R0,A
		
		
		MOV		R0,#31H			;µÚ1Î»
		MOV		A,@R0
		MOV		R3,A
		MOV		R0,#61H
		MOV		A,@R0
		ADD		A,R3
		MOV		R4,A
		SUBB	A,#10
		JC		CARRY8
		SJMP	NOCARRY8
CARRY8:	
		MOV		A,R4
NOCARRY8:
		MOV		R0,#81H
		MOV		@R0,A
_11:

		MOV		R0,#40H
		CJNE	@R0,#12,_12GOTO	;¼õ·¨
		SJMP	_12_
_12GOTO:
		LJMP	_12
_12_:
		MOV		R0,#68H			;µÚ8Î»
		MOV		A,@R0
		MOV		R3,A
		MOV		R0,#38H
		MOV		A,@R0
		MOV		R4,A
		CLR		C
		SUBB	A,R3			;²»¹»¼õÊ±ÏòÇ°Ò»Î»½èÎ»
		MOV		R5,A
		JC		CARRY11
		SJMP	NOCARRY11
CARRY11:
		MOV		A,R4
		ADD		A,#10
		CLR		C
		SUBB	A,R3
		MOV		R5,A
		MOV		R0,#37H
		CJNE	@R0,#0,CA		;ÈôÇ°Ò»Î»Ò²Îª0ÔòÏòÇ°Ç°Î»½èÎ»
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#36H
		CJNE	@R0,#0,CA
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#35H
		CJNE	@R0,#0,CA
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#34H
		CJNE	@R0,#0,CA
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#33H
		CJNE	@R0,#0,CA
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#32H
		CJNE	@R0,#0,CA
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#31H
CA:
		DEC		@R0
		
NOCARRY11:
		MOV		R0,#88H
		MOV		A,R5
		MOV		@R0,A
		
		
		MOV		R0,#67H			;µÚ7Î»
		MOV		A,@R0
		MOV		R3,A
		MOV		R0,#37H
		MOV		A,@R0
		MOV		R4,A
		CLR		C
		SUBB	A,R3
		MOV		R5,A
		JC		CARRY22
		SJMP	NOCARRY22
CARRY22:
		MOV		A,R4
		ADD		A,#10
		CLR		C
		SUBB	A,R3
		MOV		R5,A
		MOV		R0,#36H
		CJNE	@R0,#0,CB
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#35H
		CJNE	@R0,#0,CB
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#34H
		CJNE	@R0,#0,CB
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#33H
		CJNE	@R0,#0,CB
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#32H
		CJNE	@R0,#0,CB
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#31H
CB:
		DEC		@R0		
		
NOCARRY22:
		MOV		R0,#87H
		MOV		A,R5
		MOV		@R0,A
		
		
		MOV		R0,#66H			;µÚ6Î»
		MOV		A,@R0
		MOV		R3,A
		MOV		R0,#36H
		MOV		A,@R0
		MOV		R4,A
		CLR		C
		SUBB	A,R3
		MOV		R5,A
		JC		CARRY33
		SJMP	NOCARRY33
CARRY33:
		MOV		A,R4
		ADD		A,#10
		CLR		C
		SUBB	A,R3
		MOV		R5,A
		MOV		R0,#35H
		CJNE	@R0,#0,CC
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#34H
		CJNE	@R0,#0,CC
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#33H
		CJNE	@R0,#0,CC
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#32H
		CJNE	@R0,#0,CC
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#31H
CC:
		DEC		@R0
		
NOCARRY33:
		MOV		R0,#86H
		MOV		A,R5
		MOV		@R0,A
		
		
		MOV		R0,#65H			;µÚ5Î»
		MOV		A,@R0
		MOV		R3,A
		MOV		R0,#35H
		MOV		A,@R0
		MOV		R4,A
		CLR		C
		SUBB	A,R3
		MOV		R5,A
		JC		CARRY44
		SJMP	NOCARRY44
CARRY44:
		MOV		A,R4
		ADD		A,#10
		CLR		C
		SUBB	A,R3
		MOV		R5,A
		MOV		R0,#34H
		CJNE	@R0,#0,CD
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#33H
		CJNE	@R0,#0,CD
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#32H
		CJNE	@R0,#0,CD
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#31H
CD:
		DEC		@R0
		
NOCARRY44:
		MOV		R0,#85H
		MOV		A,R5
		MOV		@R0,A
		
		
		MOV		R0,#64H			;µÚ4Î»
		MOV		A,@R0
		MOV		R3,A
		MOV		R0,#34H
		MOV		A,@R0
		MOV		R4,A
		CLR		C
		SUBB	A,R3
		MOV		R5,A
		JC		CARRY55
		SJMP	NOCARRY55
CARRY55:
		MOV		A,R4
		ADD		A,#10
		CLR		C
		SUBB	A,R3
		MOV		R5,A
		MOV		R0,#33H
		CJNE	@R0,#0,CE
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#32H
		CJNE	@R0,#0,CE
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#31H
CE:
		DEC		@R0
		
NOCARRY55:
		MOV		R0,#84H
		MOV		A,R5
		MOV		@R0,A
		
		
		MOV		R0,#63H			;µÚ3Î»
		MOV		A,@R0
		MOV		R3,A
		MOV		R0,#33H
		MOV		A,@R0
		MOV		R4,A
		CLR		C
		SUBB	A,R3
		MOV		R5,A
		JC		CARRY66
		SJMP	NOCARRY66
CARRY66:
		MOV		A,R4
		ADD		A,#10
		CLR		C
		SUBB	A,R3
		MOV		R5,A
		MOV		R0,#32H
		CJNE	@R0,#0,CF
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#31H
CF:
		DEC		@R0
		
NOCARRY66:
		MOV		R0,#83H
		MOV		A,R5
		MOV		@R0,A
		
		
		MOV		R0,#62H			;µÚ2Î»
		MOV		A,@R0
		MOV		R3,A
		MOV		R0,#32H
		MOV		A,@R0
		MOV		R4,A
		CLR		C
		SUBB	A,R3
		MOV		R5,A
		JC		CARRY77
		SJMP	NOCARRY77
CARRY77:
		MOV		A,R4
		ADD		A,#10
		CLR		C
		SUBB	A,R3
		MOV		R5,A
		MOV		R0,#31H
		DEC		@R0
		
NOCARRY77:
		MOV		R0,#82H
		MOV		A,R5
		MOV		@R0,A
		
		
		MOV		R0,#61H			;µÚ1Î»
		MOV		A,@R0
		MOV		R3,A
		MOV		R0,#31H
		MOV		A,@R0
		MOV		R4,A
		CLR		C
		SUBB	A,R3
		MOV		R5,A
		JC		CARRY88
		SJMP	NOCARRY88
CARRY88:
		MOV		A,R4
		ADD		A,#10
		CLR		C
		SUBB	A,R3
		MOV		R5,A
		
NOCARRY88:
		MOV		R0,#81H
		MOV		A,R5
		MOV		@R0,A
_12:

		MOV		R0,#40H
		CJNE	@R0,#13,_13GOTO	;³Ë·¨
		SJMP	_13_
_13GOTO:
		LJMP	_13
_13_:
ROUND:
		MOV		R0,#68H
		CJNE	@R0,#0,M
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#67H
		CJNE	@R0,#0,M
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#66H
		CJNE	@R0,#0,M
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#65H
		CJNE	@R0,#0,M
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#64H
		CJNE	@R0,#0,M
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#63H
		CJNE	@R0,#0,M
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#62H
		CJNE	@R0,#0,M
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#61H
		CJNE	@R0,#0,M
		LJMP	_13
M:
		DEC		@R0				;Ã¿¼ÓÒ»´ÎµÚÒ»¸öÊý£¬¾Í°ÑµÚ¶þ¸öÊý¼õÒ»
		
		MOV		R0,#38H			;µÚ8Î»
		MOV		A,@R0
		MOV		R3,A
		MOV		R0,#88H
		MOV		A,@R0
		ADD		A,R3
		MOV		R4,A
		CLR		C
		SUBB	A,#10
		JC		CARRY111
		MOV		R0,#87H
		INC		@R0
		SJMP	NOCARRY111
CARRY111:	
		MOV		A,R4
NOCARRY111:
		MOV		R0,#88H
		MOV		@R0,A
		
		
		MOV		R0,#37H			;µÚ7Î»
		MOV		A,@R0
		MOV		R3,A
		MOV		R0,#87H
		MOV		A,@R0
		ADD		A,R3
		MOV		R4,A
		CLR		C
		SUBB	A,#10
		JC		CARRY222
		MOV		R0,#86H
		INC		@R0
		SJMP	NOCARRY222
CARRY222:	
		MOV		A,R4
NOCARRY222:
		MOV		R0,#87H
		MOV		@R0,A
		
		
		MOV		R0,#36H			;µÚ6Î»
		MOV		A,@R0
		MOV		R3,A
		MOV		R0,#86H
		MOV		A,@R0
		ADD		A,R3
		MOV		R4,A
		CLR		C
		SUBB	A,#10
		JC		CARRY333
		MOV		R0,#85H
		INC		@R0
		SJMP	NOCARRY333
CARRY333:	
		MOV		A,R4
NOCARRY333:
		MOV		R0,#86H
		MOV		@R0,A
		
		
		MOV		R0,#35H			;µÚ5Î»
		MOV		A,@R0
		MOV		R3,A
		MOV		R0,#85H
		MOV		A,@R0
		ADD		A,R3
		MOV		R4,A
		CLR		C
		SUBB	A,#10
		JC		CARRY444
		MOV		R0,#84H
		INC		@R0
		SJMP	NOCARRY444
CARRY444:	
		MOV		A,R4
NOCARRY444:
		MOV		R0,#85H
		MOV		@R0,A
		
		
		MOV		R0,#34H			;µÚ4Î»
		MOV		A,@R0
		MOV		R3,A
		MOV		R0,#84H
		MOV		A,@R0
		ADD		A,R3
		MOV		R4,A
		CLR		C
		SUBB	A,#10
		JC		CARRY555
		MOV		R0,#83H
		INC		@R0
		SJMP	NOCARRY555
CARRY555:	
		MOV		A,R4
NOCARRY555:
		MOV		R0,#84H
		MOV		@R0,A
		
		
		MOV		R0,#33H			;µÚ3Î»
		MOV		A,@R0
		MOV		R3,A
		MOV		R0,#83H
		MOV		A,@R0
		ADD		A,R3
		MOV		R4,A
		CLR		C
		SUBB	A,#10
		JC		CARRY666
		MOV		R0,#82H
		INC		@R0
		SJMP	NOCARRY666
CARRY666:	
		MOV		A,R4
NOCARRY666:
		MOV		R0,#83H
		MOV		@R0,A
		
		
		MOV		R0,#32H			;µÚ2Î»
		MOV		A,@R0
		MOV		R3,A
		MOV		R0,#82H
		MOV		A,@R0
		ADD		A,R3
		MOV		R4,A
		CLR		C
		SUBB	A,#10
		JC		CARRY777
		MOV		R0,#81H
		INC		@R0
		SJMP	NOCARRY777
CARRY777:	
		MOV		A,R4
NOCARRY777:
		MOV		R0,#82H
		MOV		@R0,A
		
		
		MOV		R0,#31H			;µÚ1Î»
		MOV		A,@R0
		MOV		R3,A
		MOV		R0,#81H
		MOV		A,@R0
		ADD		A,R3
		MOV		R4,A
		CLR		C
		SUBB	A,#10
		JC		CARRY888
		SJMP	NOCARRY888
CARRY888:	
		MOV		A,R4
NOCARRY888:
		MOV		R0,#81H
		MOV		@R0,A
		
		LJMP	ROUND
		
_13:

		MOV		R0,#40H			;³ý·¨
		CJNE	@R0,#14,_14GOTO
		SJMP	_14_
_14GOTO:
		LJMP	_14
_14_:
PLEASEHA:
		MOV		R0,#68H			;µÚ8Î»
		MOV		A,@R0
		MOV		R3,A
		MOV		R0,#38H
		MOV		A,@R0
		MOV		R4,A
		CLR		C
		SUBB	A,R3
		MOV		R5,A
		JC		CARRY1111
		SJMP	NOCARRY1111
CARRY1111:
		MOV		A,R4
		ADD		A,#10
		CLR		C
		SUBB	A,R3
		MOV		R5,A
		MOV		R0,#37H
		CJNE	@R0,#0,CAA
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#36H
		CJNE	@R0,#0,CAA
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#35H
		CJNE	@R0,#0,CAA
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#34H
		CJNE	@R0,#0,CAA
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#33H
		CJNE	@R0,#0,CAA
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#32H
		CJNE	@R0,#0,CAA
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#31H
		CJNE	@R0,#0,CAA
		LJMP	_14				;µ±¼õ²»¶¯Ê±£¬¾Í´ú±í´ËÊ±µÄ½á¹û¾ÍÊÇ³ý·¨½á¹û£¬Ö±½ÓÌø×ª
CAA:
		DEC		@R0
		
NOCARRY1111:
		MOV		R0,#38H
		MOV		A,R5
		MOV		@R0,A
		
		
		MOV		R0,#67H			;µÚ7Î»
		MOV		A,@R0
		MOV		R3,A
		MOV		R0,#37H
		MOV		A,@R0
		MOV		R4,A
		CLR		C
		SUBB	A,R3
		MOV		R5,A
		JC		CARRY2222
		SJMP	NOCARRY2222
CARRY2222:
		MOV		A,R4
		ADD		A,#10
		CLR		C
		SUBB	A,R3
		MOV		R5,A
		MOV		R0,#36H
		CJNE	@R0,#0,CBB
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#35H
		CJNE	@R0,#0,CBB
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#34H
		CJNE	@R0,#0,CBB
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#33H
		CJNE	@R0,#0,CBB
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#32H
		CJNE	@R0,#0,CBB
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#31H
		CJNE	@R0,#0,CBB
		LJMP	_14				;µ±¼õ²»¶¯Ê±£¬¾Í´ú±í´ËÊ±µÄ½á¹û¾ÍÊÇ³ý·¨½á¹û£¬Ö±½ÓÌø×ª
CBB:
		DEC		@R0		
		
NOCARRY2222:
		MOV		R0,#37H
		MOV		A,R5
		MOV		@R0,A
		
		
		MOV		R0,#66H			;µÚ6Î»
		MOV		A,@R0
		MOV		R3,A
		MOV		R0,#36H
		MOV		A,@R0
		MOV		R4,A
		CLR		C
		SUBB	A,R3
		MOV		R5,A
		JC		CARRY3333
		SJMP	NOCARRY3333
CARRY3333:
		MOV		A,R4
		ADD		A,#10
		CLR		C
		SUBB	A,R3
		MOV		R5,A
		MOV		R0,#35H
		CJNE	@R0,#0,CCC
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#34H
		CJNE	@R0,#0,CCC
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#33H
		CJNE	@R0,#0,CCC
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#32H
		CJNE	@R0,#0,CCC
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#31H
		CJNE	@R0,#0,CCC
		LJMP	_14				;µ±¼õ²»¶¯Ê±£¬¾Í´ú±í´ËÊ±µÄ½á¹û¾ÍÊÇ³ý·¨½á¹û£¬Ö±½ÓÌø×ª
CCC:
		DEC		@R0
		
NOCARRY3333:
		MOV		R0,#36H
		MOV		A,R5
		MOV		@R0,A
		
		
		MOV		R0,#65H			;µÚ5Î»
		MOV		A,@R0
		MOV		R3,A
		MOV		R0,#35H
		MOV		A,@R0
		MOV		R4,A
		CLR		C
		SUBB	A,R3
		MOV		R5,A
		JC		CARRY4444
		SJMP	NOCARRY4444
CARRY4444:
		MOV		A,R4
		ADD		A,#10
		CLR		C
		SUBB	A,R3
		MOV		R5,A
		MOV		R0,#34H
		CJNE	@R0,#0,CDD
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#33H
		CJNE	@R0,#0,CDD
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#32H
		CJNE	@R0,#0,CDD
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#31H
		CJNE	@R0,#0,CDD
		LJMP	_14				;µ±¼õ²»¶¯Ê±£¬¾Í´ú±í´ËÊ±µÄ½á¹û¾ÍÊÇ³ý·¨½á¹û£¬Ö±½ÓÌø×ª
CDD:
		DEC		@R0
		
NOCARRY4444:
		MOV		R0,#35H
		MOV		A,R5
		MOV		@R0,A
		
		
		MOV		R0,#64H			;µÚ4Î»
		MOV		A,@R0
		MOV		R3,A
		MOV		R0,#34H
		MOV		A,@R0
		MOV		R4,A
		CLR		C
		SUBB	A,R3
		MOV		R5,A
		JC		CARRY5555
		SJMP	NOCARRY5555
CARRY5555:
		MOV		A,R4
		ADD		A,#10
		CLR		C
		SUBB	A,R3
		MOV		R5,A
		MOV		R0,#33H
		CJNE	@R0,#0,CEE
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#32H
		CJNE	@R0,#0,CEE
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#31H
		CJNE	@R0,#0,CEE
		LJMP	_14				;µ±¼õ²»¶¯Ê±£¬¾Í´ú±í´ËÊ±µÄ½á¹û¾ÍÊÇ³ý·¨½á¹û£¬Ö±½ÓÌø×ª
CEE:
		DEC		@R0
		
NOCARRY5555:
		MOV		R0,#34H
		MOV		A,R5
		MOV		@R0,A
		
		
		MOV		R0,#63H			;µÚ3Î»
		MOV		A,@R0
		MOV		R3,A
		MOV		R0,#33H
		MOV		A,@R0
		MOV		R4,A
		CLR		C
		SUBB	A,R3
		MOV		R5,A
		JC		CARRY6666
		SJMP	NOCARRY6666
CARRY6666:
		MOV		A,R4
		ADD		A,#10
		CLR		C
		SUBB	A,R3
		MOV		R5,A
		MOV		R0,#32H
		CJNE	@R0,#0,CFF
		MOV		A,#9
		MOV		@R0,A
		MOV		R0,#31H
		CJNE	@R0,#0,CFF
		LJMP	_14				;µ±¼õ²»¶¯Ê±£¬¾Í´ú±í´ËÊ±µÄ½á¹û¾ÍÊÇ³ý·¨½á¹û£¬Ö±½ÓÌø×ª
CFF:
		DEC		@R0
		
NOCARRY6666:
		MOV		R0,#33H
		MOV		A,R5
		MOV		@R0,A
		
		
		MOV		R0,#62H			;µÚ2Î»
		MOV		A,@R0
		MOV		R3,A
		MOV		R0,#32H
		MOV		A,@R0
		MOV		R4,A
		CLR		C
		SUBB	A,R3
		MOV		R5,A
		JC		CARRY7777
		SJMP	NOCARRY7777
CARRY7777:
		MOV		A,R4
		ADD		A,#10
		CLR		C
		SUBB	A,R3
		MOV		R5,A
		MOV		R0,#31H
		CJNE	@R0,#0,CCCC
		LJMP	_14				;µ±¼õ²»¶¯Ê±£¬¾Í´ú±í´ËÊ±µÄ½á¹û¾ÍÊÇ³ý·¨½á¹û£¬Ö±½ÓÌø×ª
CCCC:		
		DEC		@R0
		
NOCARRY7777:
		MOV		R0,#32H
		MOV		A,R5
		MOV		@R0,A
		
		
		MOV		R0,#61H			;µÚ1Î»
		MOV		A,@R0
		MOV		R3,A
		MOV		R0,#31H
		MOV		A,@R0
		MOV		R4,A
		CLR		C
		SUBB	A,R3
		MOV		R5,A
		JC		CARRY8888
		SJMP	NOCARRY8888
CARRY8888:
		LJMP	_14				;µ±¼õ²»¶¯Ê±£¬¾Í´ú±í´ËÊ±µÄ½á¹û¾ÍÊÇ³ý·¨½á¹û£¬Ö±½ÓÌø×ª

NOCARRY8888:
		MOV		R0,#31H
		MOV		A,R5
		MOV		@R0,A
		
		
		MOV		R0,#88H			;Ã¿½øÐÐÒ»´Î¼õ·¨£¬½á¹û¾Í¼ÓÒ»
		INC		@R0
		CJNE	@R0,#10,PLEASE
		MOV		@R0,#0
		MOV		R0,#87H
		INC		@R0
		CJNE	@R0,#10,PLEASE
		MOV		@R0,#0
		MOV		R0,#86H
		INC		@R0
		CJNE	@R0,#10,PLEASE
		MOV		@R0,#0
		MOV		R0,#85H
		INC		@R0
		CJNE	@R0,#10,PLEASE
		MOV		@R0,#0
		MOV		R0,#84H
		INC		@R0
		CJNE	@R0,#10,PLEASE
		MOV		@R0,#0
		MOV		R0,#83H
		INC		@R0
		CJNE	@R0,#10,PLEASE
		MOV		@R0,#0
		MOV		R0,#82H
		INC		@R0
		CJNE	@R0,#10,PLEASE
		MOV		@R0,#0
		MOV		R0,#81H
		INC		@R0
		CJNE	@R0,#10,PLEASE
		MOV		@R0,#0
		
PLEASE:	LJMP	PLEASEHA
_14:

FINAL:
		MOV		R0,#81H			;°Ñ81H~88HµÄÖµ×ªÒÆÖÁ31H~38H£¬ÒÔ±ã½øÐÐÁ¬ÐøµÄÔËËã
		MOV		A,@R0
		MOV		R0,#31H
		MOV		@R0,A
		MOV		R0,#82H
		MOV		A,@R0
		MOV		R0,#32H
		MOV		@R0,A
		MOV		R0,#83H
		MOV		A,@R0
		MOV		R0,#33H
		MOV		@R0,A
		MOV		R0,#84H
		MOV		A,@R0
		MOV		R0,#34H
		MOV		@R0,A
		MOV		R0,#85H
		MOV		A,@R0
		MOV		R0,#35H
		MOV		@R0,A
		MOV		R0,#86H
		MOV		A,@R0
		MOV		R0,#36H
		MOV		@R0,A
		MOV		R0,#87H
		MOV		A,@R0
		MOV		R0,#37H
		MOV		@R0,A
		MOV		R0,#88H
		MOV		A,@R0
		MOV		R0,#38H
		MOV		@R0,A
		
		MOV		R0,#39H
		MOV		@R0,#1
		MOV		R0,#41H
		MOV		@R0,#1
		MOV		R0,#42H
		MOV		@R0,#1
		MOV		R0,#43H
		MOV		@R0,#1
		MOV		R0,#44H
		MOV		@R0,#1
		MOV		R0,#45H
		MOV		@R0,#1
		MOV		R0,#46H
		MOV		@R0,#1
		MOV		R0,#47H
		MOV		@R0,#1
		
		MOV		R0,#31H			;ÓÃÀ´¾ö¶¨ÐÂµÄµÚÒ»¸öÊýÏÔÊ¾ÄÄÐ©µÆ¹Ü
		CJNE	@R0,#0,SHOW1
		MOV		R0,#39H
		MOV		@R0,#0
		SJMP	SHOW_1
SHOW1:
		LJMP	OK
SHOW_1:
		MOV		R0,#32H
		CJNE	@R0,#0,SHOW2
		MOV		R0,#41H
		MOV		@R0,#0
		SJMP	SHOW_2
SHOW2:
		LJMP	OK
SHOW_2:
		MOV		R0,#33H
		CJNE	@R0,#0,SHOW3
		MOV		R0,#42H
		MOV		@R0,#0
		SJMP	SHOW_3
SHOW3:
		LJMP	OK
SHOW_3:
		MOV		R0,#34H
		CJNE	@R0,#0,SHOW4
		MOV		R0,#43H
		MOV		@R0,#0
		SJMP	SHOW_4
SHOW4:
		LJMP	OK
SHOW_4:
		MOV		R0,#35H
		CJNE	@R0,#0,SHOW5
		MOV		R0,#44H
		MOV		@R0,#0
		SJMP	SHOW_5
SHOW5:
		LJMP	OK
SHOW_5:
		MOV		R0,#36H
		CJNE	@R0,#0,SHOW6
		MOV		R0,#45H
		MOV		@R0,#0
		SJMP	SHOW_6
SHOW6:
		LJMP	OK
SHOW_6:
		MOV		R0,#37H
		CJNE	@R0,#0,SHOW7
		MOV		R0,#46H
		MOV		@R0,#0
		SJMP	SHOW_7
SHOW7:
		LJMP	OK
SHOW_7:

OK:
		MOV		R4,#8
		MOV		R0,#61H
F1:		MOV		@R0,#0
		INC		R0
		DJNZ	R4,F1
		MOV		R4,#8
		
		MOV		R0,#71H
F2:		MOV		@R0,#0
		INC		R0
		DJNZ	R4,F2
		MOV		R4,#8
		
		MOV		R0,#81H
F3:		MOV		@R0,#0
		INC		R0
		DJNZ	R4,F3
		

GO5:
		CJNE	A,#16,EXIT		;°ÑËùÓÐÎ»ÊýÈ«²¿ÇåÁã£¬³ÌÐò¸´Î»
		MOV		R0,#39H
		MOV		@R0,#0
		MOV		R0,#70H
		MOV		@R0,#0
		MOV		R0,#30H
		MOV		@R0,#0
		MOV		R0,#50H
		MOV		@R0,#0
		MOV		R0,#40H
		MOV		@R0,#0
		MOV		R4,#8
		
		MOV		R0,#31H
EIGHT:	MOV		@R0,#0
		INC		R0
		DJNZ	R4,EIGHT
		MOV		R4,#8
		
		MOV		R0,#41H
EIGHT1:	MOV		@R0,#0
		INC		R0
		DJNZ	R4,EIGHT1
		MOV		R4,#8
		
		MOV		R0,#61H
EIGHT2:	MOV		@R0,#0
		INC		R0
		DJNZ	R4,EIGHT2
		MOV		R4,#8
		
		MOV		R0,#71H
EIGHT3:	MOV		@R0,#0
		INC		R0
		DJNZ	R4,EIGHT3
		MOV		R4,#8
		
		MOV		R0,#81H
EIGHT4:	MOV		@R0,#0
		INC		R0
		DJNZ	R4,EIGHT4
		
		MOV		R0,#0			;°üÀ¨¼Ä´æÆ÷Ò²È«²¿ÇåÁã
		MOV		R1,#0
		MOV		R2,#0
		MOV		R3,#0
		MOV		R4,#0
		MOV		R5,#0
		MOV		R6,#0
		MOV		R7,#0
		MOV		A,#0
		CLR		C
		MOV 	0xE7,#00100000B	;ÄÚÖÃ¸´Î»£¬·½±ã¿ì½Ý
		
		LJMP	MAIN
EXIT:
		MOV		R1,A
		AJMP	K4
NEXT:	INC		R6
		MOV		A,R2
		JNB		ACC.0,K4
		RR		A
		MOV		R2,A
		AJMP	K3
K4:
		LCALL	DISPLAY
		LCALL	KS
		JNZ		K4
		RET

KS:		/* °´¼ü¼ì²â */
		MOV		P1,#0F0H		;¸ß4Î»¶ÔÓ¦ÐÐ£¬P1.7-S1~S4£¬P1.6-S5~S8
		MOV		A,P1			;P1.5-S9~S12£¬P1.4-S13~S16
		XRL		A,#0F0H
		
		RET
		
DISPLAY:						;ÏÔÊ¾
		PUSH	ACC
		
		CJNE	R7,#0,SECOND1	;¾ö¶¨ÕâÊÇµÚÒ»¸öÊý»¹ÊÇµÚ¶þ¸öÊý
		MOV		R0,#41H
		CJNE	@R0,#1,JUMP1	;¾ö¶¨ÊÇ·ñÏÔÊ¾Õâ¸öÊý
		MOV		R0,#30H
		CJNE	@R0,#1,NMOVE1	;¾ö¶¨
		MOV		R0,#39H
		MOV		@R0,#1
		MOV		R0,#32H
		MOV		A,@R0
		MOV		R0,#31H
		MOV		@R0,A
		AJMP	FIRST1
NMOVE1:
		MOV		R0,#39H
		CJNE	@R0,#1,JUMP1
		MOV		R0,#31H
		MOV		A,@R0
		AJMP	FIRST1
SECOND1:
		MOV		R0,#71H
		CJNE	@R0,#1,JUMP1
		MOV		R0,#30H
		CJNE	@R0,#1,NMOVE2
		MOV		R0,#70H
		MOV		@R0,#1
		MOV		R0,#62H
		MOV		A,@R0
		MOV		R0,#61H
		MOV		@R0,A
		AJMP	FIRST1
NMOVE2:
		MOV		R0,#70H
		CJNE	@R0,#1,JUMP1
		MOV		R0,#61H
		MOV		A,@R0
FIRST1:
		MOV		DPTR,#LED
		MOVC	A,@A+DPTR		;²é±íÑ¡Ôñ¹²Òõ¼«×ÖÐÎÂë
		MOV		P0,A			;½«×ÖÐÎÂëËÍÈëP0£¬ÊýÂë¹ÜÏÔÊ¾ÏàÓ¦Êý×Ö
		MOV		A,#11100B
		MOV		P2,A			;Ñ¡ÔñÊýÂë¹ÜLED8
		LCALL	DELAY10MS
		
JUMP1:	
		CJNE	R7,#0,SECOND2
		MOV		R0,#42H
		CJNE	@R0,#1,JUMP2
		MOV		R0,#30H
		CJNE	@R0,#1,NMOVE3
		MOV		R0,#33H
		MOV		A,@R0
		MOV		R0,#32H
		MOV		@R0,A
		AJMP	FIRST2
NMOVE3:
		MOV		R0,#41H
		CJNE	@R0,#1,JUMP2
		MOV		R0,#32H
		MOV		A,@R0
		AJMP	FIRST2
SECOND2:
		MOV		R0,#72H
		CJNE	@R0,#1,JUMP2
		MOV		R0,#30H
		CJNE	@R0,#1,NMOVE4
		MOV		R0,#63H
		MOV		A,@R0
		MOV		R0,#62H
		MOV		@R0,A
		AJMP	FIRST2
NMOVE4:	
		MOV		R0,#71H
		CJNE	@R0,#1,JUMP2
		MOV		R0,#62H
		MOV		A,@R0
FIRST2:
		MOV		DPTR,#LED
		MOVC	A,@A+DPTR		;²é±íÑ¡Ôñ¹²Òõ¼«×ÖÐÎÂë
		MOV		P0,A			;½«×ÖÐÎÂëËÍÈëP0£¬ÊýÂë¹ÜÏÔÊ¾ÏàÓ¦Êý×Ö
		MOV		A,#11000B
		MOV		P2,A			;Ñ¡ÔñÊýÂë¹ÜLED7
		LCALL	DELAY10MS
		
JUMP2:
		CJNE	R7,#0,SECOND3
		MOV		R0,#43H
		CJNE	@R0,#1,JUMP3
		MOV		R0,#30H
		CJNE	@R0,#1,NMOVE5
		MOV		R0,#34H
		MOV		A,@R0
		MOV		R0,#33H
		MOV		@R0,A
		AJMP	FIRST3
NMOVE5:
		MOV		R0,#42H
		CJNE	@R0,#1,JUMP3
		MOV		R0,#33H
		MOV		A,@R0
		AJMP	FIRST3
SECOND3:
		MOV		R0,#73H
		CJNE	@R0,#1,JUMP3
		MOV		R0,#30H
		CJNE	@R0,#1,NMOVE6
		MOV		R0,#64H
		MOV		A,@R0
		MOV		R0,#63H
		MOV		@R0,A
		AJMP	FIRST3
NMOVE6:	
		MOV		R0,#72H
		CJNE	@R0,#1,JUMP3
		MOV		R0,#63H
		MOV		A,@R0
FIRST3:
		MOV		DPTR,#LED
		MOVC	A,@A+DPTR		;²é±íÑ¡Ôñ¹²Òõ¼«×ÖÐÎÂë
		MOV		P0,A			;½«×ÖÐÎÂëËÍÈëP0£¬ÊýÂë¹ÜÏÔÊ¾ÏàÓ¦Êý×Ö
		MOV		A,#10100B
		MOV		P2,A			;Ñ¡ÔñÊýÂë¹ÜLED6
		LCALL	DELAY10MS
		
JUMP3:
		CJNE	R7,#0,SECOND4
		MOV		R0,#44H
		CJNE	@R0,#1,JUMP4
		MOV		R0,#30H
		CJNE	@R0,#1,NMOVE7
		MOV		R0,#35H
		MOV		A,@R0
		MOV		R0,#34H
		MOV		@R0,A
		SJMP	FIRST4
NMOVE7:
		MOV		R0,#43H
		CJNE	@R0,#1,JUMP4
		MOV		R0,#34H
		MOV		A,@R0
		AJMP	FIRST4
SECOND4:
		MOV		R0,#74H
		CJNE	@R0,#1,JUMP4
		MOV		R0,#30H
		CJNE	@R0,#1,NMOVE8
		MOV		R0,#65H
		MOV		A,@R0
		MOV		R0,#64H
		MOV		@R0,A
		AJMP	FIRST4
NMOVE8:	
		MOV		R0,#73H
		CJNE	@R0,#1,JUMP4
		MOV		R0,#64H
		MOV		A,@R0
FIRST4:
		MOV		DPTR,#LED
		MOVC	A,@A+DPTR		;²é±íÑ¡Ôñ¹²Òõ¼«×ÖÐÎÂë
		MOV		P0,A			;½«×ÖÐÎÂëËÍÈëP0£¬ÊýÂë¹ÜÏÔÊ¾ÏàÓ¦Êý×Ö
		MOV		A,#10000B
		MOV		P2,A			;Ñ¡ÔñÊýÂë¹ÜLED5
		LCALL	DELAY10MS
		
JUMP4:
		CJNE	R7,#0,SECOND5
		MOV		R0,#45H
		CJNE	@R0,#1,JUMP5
		MOV		R0,#30H
		CJNE	@R0,#1,NMOVE9
		MOV		R0,#36H
		MOV		A,@R0
		MOV		R0,#35H
		MOV		@R0,A
		AJMP	FIRST5
NMOVE9:
		MOV		R0,#44H
		CJNE	@R0,#1,JUMP5
		MOV		R0,#35H
		MOV		A,@R0
		AJMP	FIRST5
SECOND5:
		MOV		R0,#75H
		CJNE	@R0,#1,JUMP5
		MOV		R0,#30H
		CJNE	@R0,#1,NMOVE10
		MOV		R0,#66H
		MOV		A,@R0
		MOV		R0,#65H
		MOV		@R0,A
		AJMP	FIRST5
NMOVE10:
		MOV		R0,#74H
		CJNE	@R0,#1,JUMP5
		MOV		R0,#65H
		MOV		A,@R0
FIRST5:
		MOV		DPTR,#LED
		MOVC	A,@A+DPTR		;²é±íÑ¡Ôñ¹²Òõ¼«×ÖÐÎÂë
		MOV		P0,A			;½«×ÖÐÎÂëËÍÈëP0£¬ÊýÂë¹ÜÏÔÊ¾ÏàÓ¦Êý×Ö
		MOV		A,#01100B
		MOV		P2,A			;Ñ¡ÔñÊýÂë¹ÜLED4
		LCALL	DELAY10MS
		
JUMP5:
		CJNE	R7,#0,SECOND6
		MOV		R0,#46H
		CJNE	@R0,#1,JUMP6
		MOV		R0,#30H
		CJNE	@R0,#1,NMOVE11
		MOV		R0,#37H
		MOV		A,@R0
		MOV		R0,#36H
		MOV		@R0,A
		AJMP	FIRST6
NMOVE11:
		MOV		R0,#45H
		CJNE	@R0,#1,JUMP6
		MOV		R0,#36H
		MOV		A,@R0
		AJMP	FIRST6
SECOND6:
		MOV		R0,#76H
		CJNE	@R0,#1,JUMP6
		MOV		R0,#30H
		CJNE	@R0,#1,NMOVE12
		MOV		R0,#67H
		MOV		A,@R0
		MOV		R0,#66H
		MOV		@R0,A
		AJMP	FIRST6
NMOVE12:
		MOV		R0,#75H
		CJNE	@R0,#1,JUMP6
		MOV		R0,#66H
		MOV		A,@R0
FIRST6:
		MOV		DPTR,#LED
		MOVC	A,@A+DPTR		;²é±íÑ¡Ôñ¹²Òõ¼«×ÖÐÎÂë
		MOV		P0,A			;½«×ÖÐÎÂëËÍÈëP0£¬ÊýÂë¹ÜÏÔÊ¾ÏàÓ¦Êý×Ö
		MOV		A,#01000B
		MOV		P2,A			;Ñ¡ÔñÊýÂë¹ÜLED3
		LCALL	DELAY10MS
		
JUMP6:
		CJNE	R7,#0,SECOND7
		MOV		R0,#47H
		CJNE	@R0,#1,JUMP7
		MOV		R0,#30H
		CJNE	@R0,#1,NMOVE13
		MOV		R0,#38H
		MOV		A,@R0
		MOV		R0,#37H
		MOV		@R0,A
		AJMP	FIRST7
NMOVE13:
		MOV		R0,#46H
		CJNE	@R0,#1,JUMP7
		MOV		R0,#37H
		MOV		A,@R0
		AJMP	FIRST7
SECOND7:
		MOV		R0,#77H
		CJNE	@R0,#1,JUMP7
		MOV		R0,#30H
		CJNE	@R0,#1,NMOVE14
		MOV		R0,#68H
		MOV		A,@R0
		MOV		R0,#67H
		MOV		@R0,A
		AJMP	FIRST7
NMOVE14:
		MOV		R0,#76H
		CJNE	@R0,#1,JUMP7
		MOV		R0,#67H
		MOV		A,@R0
FIRST7:
		MOV		DPTR,#LED
		MOVC	A,@A+DPTR		;²é±íÑ¡Ôñ¹²Òõ¼«×ÖÐÎÂë
		MOV		P0,A			;½«×ÖÐÎÂëËÍÈëP0£¬ÊýÂë¹ÜÏÔÊ¾ÏàÓ¦Êý×Ö
		MOV		A,#00100B
		MOV		P2,A			;Ñ¡ÔñÊýÂë¹ÜLED2
		LCALL	DELAY10MS
		
JUMP7:

		MOV		A,R1
		CJNE	R7,#0,SECOND8
		MOV		R0,#38H
		MOV		@R0,A
		AJMP	FIRST8
SECOND8:
		MOV		R0,#68H
		MOV		@R0,A
FIRST8:
		MOV		DPTR,#LED
		MOVC	A,@A+DPTR
		MOV		P0,A
		MOV		A,#00000B
		MOV		P2,A
		LCALL	DELAY10MS
		
		MOV		R0,#30H
		CJNE	@R0,#1,JUMP8
		MOV		R0,#50H
		INC		@R0
		MOV		A,@R0
		MOV		R5,A
GOO:
		CJNE	R7,#0,CHOICE2
		MOV		A,#8
		SUBB	A,R5
		MOV		R4,A
		MOV		A,#40H
		ADD		A,R4
		MOV		R0,A
		MOV		@R0,#1
		AJMP	THERE
CHOICE2:

		MOV		A,#8
		SUBB	A,R5
		MOV		R4,A
		MOV		A,#70H
		ADD		A,R4
		MOV		R0,A
		MOV		@R0,#1
THERE:
		DJNZ	R5,GOO

JUMP8:
		MOV		R0,#30H
		MOV		@R0,#0
		POP		ACC
		RET

DELAY:
		MOV		R3,#2
D4:		LCALL	DISPLAY
		DJNZ	R3,D4
		RET
		
DELAY10MS:
		MOV		R4,#60
D1:		MOV		R5,#20
D2:		DJNZ	R5,D2
		DJNZ	R4,D1
		RET
		
LED:
		DB		3FH,06H,5BH,4FH,66H,6DH,7DH,07H,7FH,6FH,77H,7CH,39H,5EH,79H
		
		END
