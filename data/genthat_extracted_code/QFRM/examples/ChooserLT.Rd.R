library(QFRM)


### Name: ChooserLT
### Title: Chooser option valuation via Lattice Tree (LT) Model
### Aliases: ChooserLT

### ** Examples

(o = ChooserLT())$PxLT    #Default Chooser option price. (See Ho pg 234 in references)

o = Opt('Eu', S0=100, ttm=1, K=100)
o = OptPx(o, r=0.10, q=0, vol=0.1, NSteps=5)
(o = ChooserLT(o, t1 = .5, t2 =.5, IncBT=TRUE))$PxLT

#American Chooser, higher price than European equivalent
o = Opt('Am', S0=100, ttm=1, K=100)
o = OptPx(o, r=0.10, q=0, vol=0.1, NSteps=5)
ChooserLT(o,t1=.5, t2=.5,IncBT=FALSE)$PxLT

o = Opt('Eu', S0=50, ttm=1, K=50)
o = OptPx(o, r=0.05, q=0.02, vol=0.25, NSteps=5)
ChooserLT(o, t1 = .75, t2 = .75, IncBT=FALSE)$PxLT

o = Opt('Eu', S0=50, ttm=1, K=50)
o = OptPx(o, r=0.05, q=0.5, vol=0.25, NSteps=5)
ChooserLT(o, t1 = .75, t2 = .75, IncBT=FALSE)$PxLT



