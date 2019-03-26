library(QFRM)


### Name: RainbowBS
### Title: Rainbow option valuation via Black-Scholes (BS) model
### Aliases: RainbowBS

### ** Examples

(o = RainbowBS())$PxBS

  o = OptPx(Opt(Style = 'Rainbow',  Right = "Put"), r = 0.08)
  RainbowBS(o, S1=100, S2=95, D1=0,D2=0,sigma1=0.15,sigma2=0.2, rho=0.75,Type='Min')

  o = OptPx(Opt(Style = 'Rainbow', K = 102, ttm = 1, Right = "Put"), r = 0.08)
  RainbowBS(o, S1=100, S2=95, D1=0,D2=0,sigma1=0.15,sigma2=0.2, rho=0.75,Type='Min')

  o=OptPx(Opt(Style = 'Rainbow', K = 102, ttm = 1, Right = "Put"), r = 0.08)
  RainbowBS(o, S1=100, S2=95, D1=0,D2=0,sigma1=0.15,sigma2=0.2, rho=0.75,Type='Max')

  o=OptPx(Opt(Style = 'Rainbow', K = 102, ttm = 1, Right = "Call"), r = 0.08)
  RainbowBS(o, S1=100, S2=95, D1=0,D2=0,sigma1=0.15,sigma2=0.2, rho=0.75,Type='Min')

  o=OptPx(Opt(Style = 'Rainbow', K = 102, ttm = 1, Right = "Call"), r = 0.08)
  RainbowBS(o, S1=100, S2=95, D1=0,D2=0,sigma1=0.15,sigma2=0.2, rho=0.75,Type='Max')



