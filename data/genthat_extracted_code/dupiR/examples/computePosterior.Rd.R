library(dupiR)


### Name: computePosterior
### Title: Compute the posterior probability distribution of the population
###   size
### Aliases: computePosterior-methods computePosterior,Counts-method
###   computePosterior
### Keywords: methods

### ** Examples

K <- newCounts( counts = c(20,30), fractions = c(0.075, 0.10))

#using default parameters (DUP, sampling without replacement and default prior support)
K.dup <- computePosterior(K)

#using custom prior support (DUP)
K.cust <- computePosterior(K, n1 = 0, n2 = 1e3)

#using a Gamma prior (GP method)
K.gp <- computePosterior(K, alg = 'GP')

#plot the results (compare DUP with GP)
plotPosterior(K.dup, type = 'l', lwd = 3, col = 'blue3', low = 0.025, up = 0.975)
lines(K.gp@posterior, lwd = 3, col = 'red3')

#for sampling with replacement:
computePosterior(K, replacement = TRUE)



