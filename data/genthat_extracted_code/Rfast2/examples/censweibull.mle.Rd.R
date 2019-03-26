library(Rfast2)


### Name: MLE of the censored Weibull distribution
### Title: MLE of the zero inflated and censored Weibull distribution
### Aliases: censweibull.mle

### ** Examples

x <- rweibull(300, 3, 6)
censweibull.mle(x, di = rep(1, 300))
di <- rbinom(300, 1, 0.9)
censweibull.mle(x, di)



