library(QFRM)


### Name: BarrierMC
### Title: Barrier option valuation via Monte Carlo (MC) simulation.
### Aliases: BarrierMC

### ** Examples

(o = BarrierMC())$PxMC #Price =~ $11

 o = OptPx(o=Opt(Style='Barrier'),NSteps = 10)
 (o = BarrierMC(o))$PxMC #Price =~ $14.1

 (o = BarrierMC(NPaths = 5))$PxMC # Price =~ $11

 (o = BarrierMC(B=65))$PxMC # Price =~ $10

 (o = BarrierMC(knock="Out"))$PxMC #Price =~ $1



