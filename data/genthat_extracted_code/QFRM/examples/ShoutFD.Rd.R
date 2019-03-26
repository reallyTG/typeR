library(QFRM)


### Name: ShoutFD
### Title: Shout option valuation via finite differences (FD) method
### Aliases: ShoutFD

### ** Examples

(o = ShoutFD(OptPx(Opt(Right="C", Style="Shout"))))$PxFD

 o = OptPx(Opt(Right="C", Style="Shout"))
 (o = ShoutFD(o, N=10))$PxFD # very differnt result for N=10

 (o = ShoutFD(OptPx(Opt(Right="P", Style="Shout"))))$PxFD

 o = Opt(Right='P', S0=100, K=110, ttm=0.5, Style='Shout')
 o = OptPx(o, vol=0.2, r=0.05, q=0.04)
 (o = ShoutFD(o,N=100,Smax=200))$PxFD

 o = Opt(Right="C", S0=110, K=100, ttm=0.5, Style="Shout")
 o = OptPx(o, vol=0.2, r=0.05, q=0.04)
 (o = ShoutFD(o,N=100,Smax=200))$PxFD



