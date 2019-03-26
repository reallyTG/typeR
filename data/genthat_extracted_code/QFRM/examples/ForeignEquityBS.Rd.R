library(QFRM)


### Name: ForeignEquityBS
### Title: ForeignEquity option valuation via Black-Scholes (BS) model
### Aliases: ForeignEquityBS

### ** Examples

o = OptPx(Opt(Style = 'ForeignEquity', Right = "Put"), r= 0.03)
ForeignEquityBS(o, I1=1540, I2=1/90, g1=.02, sigma1=.14,sigma2=0.18, rho=.03,Type='Foreign')

o = OptPx(Opt(Style = 'ForeignEquity',  Right = "Put", ttm=9/12, K=1600), r=.03)
ForeignEquityBS(o, I1=1540, I2=1/90, g1=.02, sigma1=.14,sigma2=0.18, rho=0.03,Type='Foreign')

o = OptPx(Opt(Style = 'ForeignEquity', Right = "C", ttm=9/12, K=1600), r=.03)
ForeignEquityBS(o, I1=1540, I2=1/90, g1=.02, sigma1=.14,sigma2=0.18, rho=0.03,Type='Foreign')

o = OptPx(Opt(Style = 'ForeignEquity', Right = "C", ttm=9/12, K=1600), r=.03)
ForeignEquityBS(o, I1=1540, I2=1/90, g1=.02, sigma1=.14,sigma2=0.18, rho=0.03,Type='Domestic')

o = OptPx(Opt(Style = 'ForeignEquity', Right = "P", ttm=9/12, K=1600), r=.03)
ForeignEquityBS(o, I1=1540, I2=1/90, g1=.02, sigma1=.14,sigma2=0.18, rho=0.03,Type='Domestic')



