library(mixdist)


### Name: fitted.mix
### Title: Compute Mixture Model Fitted Values
### Aliases: fitted.mix
### Keywords: models

### ** Examples

data(pike65)
data(pikepar)
fit1 <- mix(pike65, pikepar, "lnorm", mixconstr(consigma = "CCV"), emsteps = 3)
fitted(fit1)
data(pike65sg)
fit2 <- mix(pike65sg, pikepar, "gamma", mixconstr(consigma = "CCV"), usecondit = TRUE)
fitted(fit2, digits = 2)



