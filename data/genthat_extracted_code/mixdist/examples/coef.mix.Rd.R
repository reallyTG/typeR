library(mixdist)


### Name: coef.mix
### Title: Extract Mixture Model Coefficients
### Aliases: coef.mix
### Keywords: models

### ** Examples

data(pike65) # load the grouped data `pike65'
data(pikepar) # load the initial values of parameters for the data `pike65'
fit <- mix(pike65, pikepar, "lnorm", mixconstr(consigma = "CCV"), emsteps = 3)
coef(fit)
coef(fit, natpar = TRUE)



