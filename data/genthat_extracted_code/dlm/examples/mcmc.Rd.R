library(dlm)


### Name: mcmc
### Title: Utility functions for MCMC output analysis
### Aliases: mcmcMean mcmcMeans mcmcSD ergMean
### Keywords: misc

### ** Examples

x <- matrix(rexp(1000), nc=4)
dimnames(x) <- list(NULL, LETTERS[1:NCOL(x)])
mcmcSD(x)
mcmcMean(x)
em <- ergMean(x, m = 51)
plot(ts(em, start=51), xlab="Iteration", main="Ergodic means")



