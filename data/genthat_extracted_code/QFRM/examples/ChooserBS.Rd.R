library(QFRM)


### Name: ChooserBS
### Title: Chooser option valuation via Black-Scholes (BS) model
### Aliases: ChooserBS

### ** Examples

(o = ChooserBS())$PxBS

o = Opt(Style='Chooser',Right='Other',S0=50, K=50)
(o = ChooserBS(OptPx(o, r=0.06, q=0.02, vol=0.2),9/12, 3/12))$PxBS

o = Opt(Style='Chooser',Right='Other',S0=50, K=50)
(o = ChooserBS (OptPx(o,r=0.08, q=0, vol=0.25),1/2, 1/4))$PxBS

o = Opt(Style='Chooser',Right='Other',S0=100, K=50)
(o = ChooserBS(OptPx(o,r=0.08, q=0.05, vol=0.3),1/2, 1/4))$PxBS



