library(QFRM)


### Name: CompoundBS
### Title: Compound option valuation with Black-Scholes (BS) model
### Aliases: CompoundBS

### ** Examples

(o <- CompoundBS())$PxBS #price compound option with default parameters

o = OptPx(Opt(Style='Compound'), r=0.05, q=0.0, vol=0.25)
CompoundBS(o,K1=10,T1=0.5)

o = Opt(Style='Compound', S0=50, K=52, ttm=1)
CompoundBS(o=OptPx(o, r=.05, q=0, vol=.25),K1=6,T1=1.5)

o = Opt(Style='Compound', S0=90, K=100, ttm=1.5)
CompoundBS(o=OptPx(o, r=.05, q=0, vol=.25),K1=15,T1=1)

o = Opt(Style='Compound', S0=15, K=15, ttm=0.25)
CompoundBS(o=OptPx(o, r=.05, q=0, vol=.25),K1=3,T1=1.5)



