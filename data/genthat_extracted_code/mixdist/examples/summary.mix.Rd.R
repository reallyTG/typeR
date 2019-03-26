library(mixdist)


### Name: summary.mix
### Title: Summarizing Mixture Model Fits
### Aliases: summary.mix
### Keywords: models

### ** Examples

data(pike65)
data(pikepar)
fit <- mix(pike65, pikepar, "lnorm", mixconstr(consigma = "CCV"), emsteps = 3)
fit
summary(fit)



