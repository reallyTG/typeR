library(QFRM)


### Name: CompoundLT
### Title: Compound option valuation via lattice tree (LT) model
### Aliases: CompoundLT

### ** Examples

(o = CompoundLT())$PxLT # Uses default arguments

#Put option on a Call:
o = Opt(Style="Compound", S0=50, ttm=.5, Right="P", K = 50)
o1 = OptPx(o, r = .1, vol = .4, NSteps = 5)
o = Opt(Style="Compound", S0=50, ttm=.75, Right="C", K = 60)
o2 = OptPx(o, r = .1, vol = .4, NSteps = 5)
(o = CompoundLT(o1, o2))$PxLT

#Call option on a Call:
o = Opt(Style = "Compound", S0 = 50, ttm= .5, Right = "Call", K = 50)
o1 = OptPx(o, r = .1, vol = .4, NSteps = 5)
o = Opt(Style = "Compound", S0 = 50, ttm= .75, Right = "Call", K = 5)
o2 = OptPx(o, r = .1, vol = .4, NSteps = 5)
(o = CompoundLT(o1, o2))$PxLT

#Put option on a Put:
o = Opt(Style = "Compound", S0 = 50, ttm= .5, Right = "Put", K = 40)
o1 = OptPx(o, r = .1, vol = .4, NSteps = 5)
o = Opt(Style = "Compound", S0 = 50, ttm= .75, Right = "Put", K = 50)
o2 = OptPx(o, r = .1, vol = .4, NSteps = 5)
(o = CompoundLT(o1, o2))$PxMC

#Call option on a Put:
o = Opt(Style = "Compound", S0 = 50, ttm= .5, Right = "Call", K = 30)
o1 = OptPx(o, r = .1, vol = .4, NSteps = 5)
o = Opt(Style = "Compound", S0 = 50, ttm= .75, Right = "Put", K = 80)
o2 = OptPx(o, r = .1, vol = .4, NSteps = 5)
(o = CompoundLT(o1, o2))$PxLT



