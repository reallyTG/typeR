library(QFRM)


### Name: HolderExtendibleBS
### Title: Holder Extendible option valuation via Black-Scholes (BS) model
### Aliases: HolderExtendibleBS

### ** Examples

(o = HolderExtendibleBS())$PxBS

o = Opt(Style='HolderExtendible',Right='Call', S0=100, ttm=0.5, K=100)
o = OptPx(o,r=0.08,q=0,vol=0.25)
(o = HolderExtendibleBS(o,k=105,t1=0.5,t2=0.75,A=1))$PxBS

o = Opt("HolderExtendible","Put", S0=100, ttm=0.5, K=100)
o = OptPx(o,r=0.08,q=0,vol=0.25)
(o = HolderExtendibleBS(o,k=90,t1=0.5,t2=0.75,A=1))$PxBS



