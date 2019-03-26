library(QFRM)


### Name: Binary_BOPM
### Title: Binary option valuation vialattice tree (LT) implementation
### Aliases: Binary_BOPM

### ** Examples

(o = Binary_BOPM())$PxBT

o = OptPx(o=Opt(Style='Binary'))
(o = Binary_BOPM(o, Type='cash', Q=100, IncBT=TRUE))$PxBT

o = OptPx(Opt(Style='Binary'), r=0.05, q=0.02, rf=0.0, vol=0.30, NSteps=5)
(o = Binary_BOPM(o, Type='cash', Q=1000, IncBT=FALSE))$PxBT

o = OptPx(o=Opt(Style='Binary'), r=0.15, q=0.01, rf=0.05, vol=0.35, NSteps=5)
(o = Binary_BOPM(o,Type='asset',Q=150, IncBT=FALSE))$PxBT

o = OptPx(o=Opt(Style='Binary'), r=0.025, q=0.001, rf=0.0, vol=0.10, NSteps=5)
(o = Binary_BOPM(o, Type='cash', Q=20, IncBT=FALSE))$PxBT



