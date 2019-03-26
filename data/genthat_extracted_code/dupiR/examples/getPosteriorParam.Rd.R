library(dupiR)


### Name: getPosteriorParam
### Title: Compute posterior probability distribution parameters
### Aliases: getPosteriorParam-methods getPosteriorParam,Counts-method
###   getPosteriorParam
### Keywords: methods

### ** Examples

K <- newCounts( counts = c(20,30), fractions = c(0.075, 0.10))

#using default parameters (DUP, sampling without replacement and default prior support)
K.dup <- computePosterior(K)

getPosteriorParam(K.dup)




