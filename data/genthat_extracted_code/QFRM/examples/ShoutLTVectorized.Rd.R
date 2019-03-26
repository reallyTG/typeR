library(QFRM)


### Name: ShoutLTVectorized
### Title: Shout option valuation via lattice tree (LT)
### Aliases: ShoutLTVectorized

### ** Examples

(o = ShoutLTVectorized( OptPx(Opt(Style='Shout'))))$PxLT

o = Opt(Style='Shout')
(o = ShoutLTVectorized( OptPx(o, r=.1, q=.02, vol=.45, NSteps=10)))$PxLT



