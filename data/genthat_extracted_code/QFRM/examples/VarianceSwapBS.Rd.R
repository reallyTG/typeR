library(QFRM)


### Name: VarianceSwapBS
### Title: Variance Swap valuation via Black-Scholes (BS) model
### Aliases: VarianceSwapBS

### ** Examples

(o = VarianceSwapBS())$PxBS

o = Opt(Style="VarianceSwap",Right="Other",ttm=.25,S0=1020)
o = OptPx(o,r=.04,q=.01)
Vol = Vol=c(.29,.28,.27,.26,.25,.24,.23,.22,.21)
(o = VarianceSwapBS(o,K=seq(800,1200,50),Vol=Vol,notional=10^8,varrate=.045))$PxBS

o = Opt(Style="VarianceSwap",Right="Other",ttm=.25,S0=1020)
o = OptPx(o,r=.04,q=.01)
Vol=c(.2,.205,.21,.215,.22,.225,.23,.235,.24)
(o =VarianceSwapBS(o,K=seq(800,1200,50),Vol=Vol,notional=10^8,varrate=.045))$PxBS

o = Opt(Style="VarianceSwap",Right="Other",ttm=.1,S0=100)
o = OptPx(o,r=.03,q=.02)
Vol=c(.2,.19,.18,.17,.16,.15,.14,.13,.12)
(o =VarianceSwapBS(o,K=seq(80,120,5),Vol=Vol,notional=10^4,varrate=.03))$PxBS



