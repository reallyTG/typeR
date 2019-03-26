library(denoiseR)


### Name: optishrink
### Title: Optimal Shrinkage
### Aliases: optishrink

### ** Examples

Xsim <- LRsim(200, 500, 10, 2)
opti.ln <- optishrink(Xsim$X, method = "LN", k = 10)
opti.asympt <- optishrink(Xsim$X, method = "ASYMPT")

Xsim <- LRsim(200, 500, 100, 1)
truesigma <- 1/(1*sqrt(200*500))
opti.asympt <- optishrink(Xsim$X, method = "ASYMPT", sigma = truesigma)
opti.asympt$nb.eigen



