library(QFRM)


### Name: AverageStrikeMC
### Title: Average Strike option valuation via Monte Carlo (MC) simulation
### Aliases: AverageStrikeMC

### ** Examples

(o = AverageStrikeMC())$PxMC   #Price =~ $3.6

  o = OptPx(o = Opt(Style='AverageStrike'), NSteps = 5)
  (o = AverageStrikeMC(o))$PxMC # Price =~ $6

  (o = AverageStrikeMC(NPaths = 20))$PxMC  #Price =~ $3.4

  o = OptPx(o = Opt(Style='AverageStrike'), NSteps = 5)
  (o = AverageStrikeMC(o, NPaths = 20))$PxMC  #Price =~ $5.6



