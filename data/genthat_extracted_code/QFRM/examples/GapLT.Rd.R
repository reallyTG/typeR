library(QFRM)


### Name: GapLT
### Title: Gap option valuation via lattice tree (LT) model
### Aliases: GapLT

### ** Examples

(o = GapLT())$PxLT

o = Opt(Style="Gap",Right='Put',S0 = 500000, ttm = 1,K = 400000)
o = OptPx(o,r = .05, q=0, vol =.2)
(o = GapLT(o,K2 = 350000,on=c(498,499,500,501,502)))$PxLT

o = Opt(Style="Gap", Right='Call',S0 = 65, ttm = 1,K = 70)
o = OptPx(o,r = .05, q=.02,vol =.1)



