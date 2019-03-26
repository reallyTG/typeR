library(QFRM)


### Name: LadderMC
### Title: Ladder option valuation via Monte Carlo (MC) simulation.
### Aliases: LadderMC

### ** Examples

(o = LadderMC())$PxMC #Price = ~12.30

 o = OptPx(o=Opt(Style='Ladder'), NSteps = 5)
 (o = LadderMC(o))$PxMC        #Price = ~11.50

 o = OptPx(Opt(Style='Ladder', Right='Put'))
 (o = LadderMC(o, NPaths = 5))$PxMC   # Price = ~12.36

 (o = LadderMC(L=c(55,65,75)))$PxMC   # Price = ~10.25



