library(QFRM)


### Name: AsianBS
### Title: Asian option valuation via Black-Scholes (BS) model
### Aliases: AsianBS

### ** Examples

(o = AsianBS())$PxBS #Price = ~4.973973,  using default values

 o = Opt(Style='Asian',S0=100,K=90,ttm=3)
 (o = AsianBS(OptPx(o,r=0.03,q=0,vol=0.3)))$PxBS

 o = Opt(Style='Asian',Right='P',S0=100,K=110,ttm=0.5)
 (o = AsianBS(OptPx(o,r=0.03,q=0.01,vol=0.3)))$PxBS

 #See J.C.Hull, OFOD'2014, 9-ed, ex.26.3, pp.610. The price is 5.62.
 o = Opt(Style='Asian',Right='Call',S0=50,K=50,ttm=1)
 (o = AsianBS(OptPx(o,r=0.1,q=0,vol=0.4)))$PxBS



