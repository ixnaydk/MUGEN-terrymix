;-------------------------|
; Arquivo CMD - Terry Mix |
; criado por Ixnaydk      |
;-------------------------|

; 1* parte do arquivo
;-| Super Motions |--------------------------------------------------------
[Command]
name = "power_geyser"
command = D, DF, F, D, DF, F, a
time = 60

[Command]
name = "buster_wolf/triple_geyser"
command = D, DF, F, D, DF, F, x
time = 60

;-| Special Motions |------------------------------------------------------
[Command]
name = "power_wave"
command = D, DF, F, a
time = 60

[Command]
name = "power_wave_b"
command = D, DF, F, b
time = 60

[Command]
name = "burning_knuckle"
command = D, DB, B, a
time = 60

[Command]
name = "crack_shot"
command = D, DF, F, x
time = 60

[Command]
name = "round_wave"
command = F, D, DF, y
time = 60

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery";Required (do not remove)
command = x+y
time = 1

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

;-| Single Button |---------------------------------------------------------
[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "start"
command = s
time = 1

;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd";Required (do not remove)
command = /$F
time = 1

[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1

;---------------------------------------------------------------------------
; 2* Parte - Os states

;Não remova a linha abaixo
[Statedef -1]
;===========================================================================
;---------------------------------------------------------------------------
;Ativação de Modos
[State -1, VarSet]
type = VarSet
trigger1 = Stateno = [3020,3050]
v = 0
value = 1

[State -1, VarSet]
type = VarSet
trigger1 = var(0) = 1 && command = "power_geyser"
v = 1 
value = 1

;---------------------------------------------------------------------------
;Triple Geyser
[State -1, Triple Geyser]
type = ChangeState
value = 3020
triggerall = var(1) = 1
triggerall = command = "buster_wolf/triple_geyser" 
triggerall = power >= 3000
triggerall = statetype != A
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA

;---------------------------------------------------------------------------
;KoF Power Geyser
[State -1, KoF Power Geyser]
type = ChangeState
value = 3010
triggerall = var(1) = 1
triggerall = command = "power_geyser"
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA

;---------------------------------------------------------------------------
;Power Geyser
[State -1, Power Geyser]
type = ChangeState
value = 3000
triggerall = command = "power_geyser"
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA

;---------------------------------------------------------------------------
;Buster Wolf
[State -1, Buster Wolf]
type = ChangeState
value = 3050
triggerall = command = "buster_wolf/triple_geyser" 
triggerall = power >= 3000
triggerall = statetype != A
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA

;===========================================================================
;Round Wave
[State -1, Round Wave]
type = ChangeState
value = 1070
triggerall = var(1) = 1
triggerall = command = "round_wave"
triggerall = statetype != A
trigger1 = statetype = S

;---------------------------------------------------------------------------
;Burning Knuckle
[State -1, Burning Knuckle]
type = ChangeState
value = 1000
triggerall = command = "burning_knuckle"
triggerall = statetype != A
trigger1 = statetype = S

;---------------------------------------------------------------------------
;Power Wave
[State -1, Power Wave]
type = ChangeState
value = ifelse (var(1) = 1, 1050, 1010)
triggerall = command = "power_wave"
triggerall = statetype != A
trigger1 = statetype = S

;---------------------------------------------------------------------------
;Power Wave Forte
[State -1, Power Wave Forte]
type = ChangeState
value = ifelse (var(1) = 1, 1060, 1015)
triggerall = command = "power_wave_b"
triggerall = statetype != A
trigger1 = statetype = S

;---------------------------------------------------------------------------
;Crack Shot 
[State -1, Crack Shot]
type = ChangeState
value = 1020
triggerall = command = "crack_shot"
triggerall = statetype != A
trigger1 = statetype = S

;---------------------------------------------------------------------------
;Soco
[State -1, Soco]
type = ChangeState
value = 200
triggerall = command = "b" && command != "holddown"
triggerall = statetype != A
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Cotovelada
[State -1, Cotovelada]
type = ChangeState
value = 201
triggerall = command = "a" && command != "holddown"
triggerall = statetype != A
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Chute
[State -1, Chute]
type = ChangeState
value = 210
triggerall = command = "x" && command != "holddown"
triggerall = statetype != A
trigger1 = P2BodyDist X > 5
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Joelhada
[State -1, Joelhada]
type = ChangeState
value = 211
triggerall = command = "x" && command != "holddown"
triggerall = statetype != A
trigger1 = P2BodyDist X < 5
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Chute Giratório
[State -1, Chute Giratório]
type = ChangeState
value = 215
triggerall = command = "y" && command != "holddown"
triggerall = statetype != A
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Soco
[State -1, Soco]
type = ChangeState
value = 400
triggerall = (command = "a" || command = "b") && command = "holddown"
triggerall = statetype != A
trigger1 = statetype = C
trigger1 = ctrl

;---------------------------------------------------------------------------
;Chute
[State -1, Chute]
type = ChangeState
value = 410
triggerall = (command = "x" || command = "y") && command = "holddown"
triggerall = statetype != A
trigger1 = statetype = C
trigger1 = ctrl

;--------------------------------------------------------------------------
;Soco Fraco
[State -1, Soco Fraco]
type = ChangeState
value = 600
triggerall = command = "a" && command != "holddown" 
trigger1 = statetype = A
trigger1 = ctrl

;--------------------------------------------------------------------------
;Soco Forte
[State -1, Soco Forte]
type = ChangeState
value = 605
triggerall = command = "b" && command != "holddown"
trigger1 = statetype = A
trigger1 = ctrl

;--------------------------------------------------------------------------
;Chute Fraco
[State -1, Chute Fraco]
type = ChangeState
value = 610
triggerall = command = "x" && command != "holddown"
trigger1 = statetype = A
trigger1 = ctrl

;-------------------------------------------------------------------------
;Chute Forte
[State -1, Chute Forte]
type = ChangeState
value = 615
triggerall = command = "y" && command != "holddown"
trigger1 = statetype = A
trigger1 = ctrl















