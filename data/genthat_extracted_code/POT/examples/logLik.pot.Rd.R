library(POT)


### Name: logLik.pot
### Title: Extract Log-Likelihood
### Aliases: logLik.pot
### Keywords: models

### ** Examples

x <- rgpd(500, 0, 1, -0.15)
mle <- fitgpd(x, 0)
logLik(mle)



