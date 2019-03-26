library(extRemes)


### Name: profliker
### Title: Profile Likelihood Function
### Aliases: profliker
### Keywords: hplot distribution

### ** Examples

z <- revd(100, loc=20, scale=0.5, shape=-0.2)
fit <- fevd(z)
fit

profliker(fit, type="parameter", which.par=3)

profliker(fit, type="parameter",
    xrange=c(-0.35, -0.2), which.par=3)





