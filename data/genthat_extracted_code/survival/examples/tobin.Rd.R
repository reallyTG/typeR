library(survival)


### Name: tobin
### Title: Tobin's Tobit data
### Aliases: tobin
### Keywords: datasets

### ** Examples

tfit <- survreg(Surv(durable, durable>0, type='left') ~age + quant,
                data=tobin, dist='gaussian')

predict(tfit,type="response")




