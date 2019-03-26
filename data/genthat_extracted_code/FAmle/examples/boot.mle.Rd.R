library(FAmle)


### Name: boot.mle
### Title: Bootstrap Distribution for Fitted Model
### Aliases: boot.mle
### Keywords: models optimize robust

### ** Examples

data(yarns)
x <- yarns$x
fit.x <- mle(x,'weibull',c(.1,.1))
boot.x <- boot.mle(fit.x,B=10)
boot.x$par.star
boot.x$p.value



