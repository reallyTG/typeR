library(QFRM)


### Name: GapMC
### Title: Gap option valuation via Monte Carlo (MC) simulation
### Aliases: GapMC

### ** Examples

(o = GapMC())$PxMC  #example 26.1, p.601

o = Opt(Style='Gap', Right='Call', S0=50, K=40, ttm=1)
o = OptPx(o, vol=.2, r=.05, q = .02)
(o = GapMC(o, K2 = 45, NPaths = 5))$PxMC

o = Opt(Style='Gap', Right='Call', S0 = 50, K = 60, ttm = 1)
o = OptPx(o, vol=.25,r=.15, q = .02)
(o = GapMC(o, K2 = 55, NPaths = 5))$PxMC

o = Opt(Style='Gap', Right = 'Put', S0 = 50, K = 57, ttm = .5)
o = OptPx(o, vol = .2, r = .09, q = .2)
(o = GapMC(o, K2 = 50, NPaths = 5))$PxMC

o = Opt(Style='Gap', Right='Call', S0=500000, K=400000, ttm=1)
o = OptPx(o, vol=.2,r=.05, q = 0)
(o = GapMC(o, K2 = 350000, NPaths = 5))$PxMC



