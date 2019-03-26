library(Rfast2)


### Name: MLE of the zero inflated Gamma and Weibull distributions
### Title: MLE of the zero inflated Gamma and Weibull distributions
### Aliases: zigamma.mle ziweibull.mle

### ** Examples

x <- rgamma(200, 4, 1)
x[sample(1:200, 20)] <- 0
zigamma.mle(x)



