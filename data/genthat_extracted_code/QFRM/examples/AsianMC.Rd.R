library(QFRM)


### Name: AsianMC
### Title: Asian option valuation with Monte Carlo (MC) simulation.
### Aliases: AsianMC

### ** Examples

(o = AsianMC())$PxMC #Price = ~5.00,  using default values

  o = OptPx(Opt(Style='Asian'), NSteps = 5)
  (o = AsianMC(o, NPaths=5))$PxMC #Price = ~$5

  (o = AsianMC(NPaths = 5))$PxMC # Price = ~$5

  o = Opt(Style='Asian', Right='Put',S0=10, K=15)
  o = OptPx(o, r=.05, vol=.1, NSteps = 5)
  (o = AsianMC(o, NPaths = 5))$PxMC # Price = ~$4

  #See J.C.Hull, OFOD'2014, 9-ed, ex.26.3, pp.610.
 o = Opt(Style='Asian',S0=50,K=50,ttm=1)
 o = OptPx(o,r=0.1,q=0,vol=0.4,NSteps=5)
 (o = AsianBS(o))$PxBS   #Price is 5.62.
 (o = AsianMC(o))$PxMC



