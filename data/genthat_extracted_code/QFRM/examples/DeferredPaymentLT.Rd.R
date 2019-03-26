library(QFRM)


### Name: DeferredPaymentLT
### Title: DeferredPaymentLT
### Aliases: DeferredPaymentLT

### ** Examples

(o = DeferredPaymentLT())$PxLT

o = Opt(Style='DeferredPayment', Right="Call", S0=110,ttm=.5,K=110)
(o = DeferredPaymentLT(OptPx(o,r=.05,q=.04,vol=.2,NSteps=5)))$PxLT

o = Opt(Style='DeferredPayment', Right="Put", S0 = 50, ttm=2,K=47)
(o = DeferredPaymentLT(OptPx(o,r=.05,q=.04,vol=.25,NSteps=3)))$PxLT



