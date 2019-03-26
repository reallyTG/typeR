library(Qtools)


### Name: confint.midquantile
### Title: Mid-distribution Functions
### Aliases: confint.midquantile
### Keywords: unconditional quantiles

### ** Examples


x <- rpois(100, lambda = 3)
mq <- midquantile(x)
confint(mq, level = 0.95)

# print standard errors
attributes(confint(mq, level = 0.95))$stderr




