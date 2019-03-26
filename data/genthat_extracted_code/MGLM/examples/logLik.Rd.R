library(MGLM)


### Name: logLik
### Title: Extract log-likelihood
### Aliases: logLik logLik,MGLMfit-method logLik,MGLMreg-method
###   logLik,MGLMsparsereg-method

### ** Examples

library("MGLM")
data("rnaseq")
data <- rnaseq[, 1:6]
dmFit <- MGLMfit(data, dist = "DM")
logLik(dmFit)



