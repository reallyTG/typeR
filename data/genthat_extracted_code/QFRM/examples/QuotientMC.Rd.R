library(QFRM)


### Name: QuotientMC
### Title: Quotient option valuation via Monte Carlo (MC) model
### Aliases: QuotientMC

### ** Examples

(o = QuotientMC())$PxMC #Default Quotient option price.

o = OptPx(Opt(S0=100, ttm=1, K=1.3), r=0.10, q=0, vol=0.1)
(o = QuotientMC(o, S0_2 = 180, NPaths=5))$PxMC

QuotientMC(OptPx(Opt()), S0_2 = 180, NPaths=5)

QuotientMC(OptPx(), S0_2 = 201, NPaths = 5)

QuotientMC(OptPx(Opt(S0=500, ttm=1, K=2)), S0_2 = 1000, NPaths=5)



