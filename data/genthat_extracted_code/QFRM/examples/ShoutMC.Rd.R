library(QFRM)


### Name: ShoutMC
### Title: Shout option valuation via Monte Carlo (MC) simulations.
### Aliases: ShoutMC

### ** Examples

(o = ShoutMC())$PxMC # Approximately valued at $11

  o = Opt(Style='Shout')
  (o = ShoutMC(OptPx(o, NSteps = 5)))$PxMC # Approximately valued at $18.6

  o = Opt(Style='Shout',S0=110,K=100,ttm=.5)
  o = OptPx(o, r=.05, vol=.2, q=0, NSteps = 10)
  (o = ShoutMC(o, NPaths = 10))$PxMC



