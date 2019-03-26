library(QFRM)


### Name: QuotientBS
### Title: Quotient option valuation via Black-Scholes (BS) model
### Aliases: QuotientBS

### ** Examples

(o = QuotientBS())$PxBS

o = OptPx(Opt(Style = 'Quotient', Right = "Put"), r= 0.05)
(o = QuotientBS(o, I1=100, I2=100, g1=0.04, g2=0.03, sigma1=0.18,sigma2=0.15, rho=0.75))$PxBS

o = OptPx(Opt(Style = 'Quotient',  Right = "Put", ttm=1, K=1), r= 0.05)
QuotientBS(o, I1=100, I2=100, g1=0.04, g2=0.03, sigma1=0.18,sigma2=0.15, rho=0.75)

o = OptPx(Opt(Style = 'Quotient',  Right = "Call", ttm=1, K=1), r= 0.05)
QuotientBS(o, I1=100, I2=100, g1=0.04, g2=0.03, sigma1=0.18,sigma2=0.15, rho=0.75)



