library(QFRM)


### Name: ShoutLT
### Title: Shout option valuation via lattice tree (LT)
### Aliases: ShoutLT

### ** Examples

(o = ShoutLT( OptPx(Opt(Style='Shout'))))$PxLT

o = Opt(Style='Shout', Right='Call', S0=60, ttm=.25, K=60)
ShoutLT( OptPx(o,r=.1, q=.02, vol=.45, NSteps=10))

o = Opt(Style='Shout', Right='Call', S0=60, ttm=.25, K=60)



