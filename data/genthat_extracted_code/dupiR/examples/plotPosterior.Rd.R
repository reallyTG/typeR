library(dupiR)


### Name: plotPosterior
### Title: Plot posterior probability distributions
### Aliases: plotPosterior-methods plotPosterior,Counts-method
###   plotPosterior plot-method plot,Counts-method
### Keywords: methods

### ** Examples

K <- newCounts( counts = c(20,30), fractions = c(0.075, 0.10))

#using default parameters (DUP, sampling without replacement and default prior support)
K.dup <- computePosterior(K)

plotPosterior(K.dup, type = 'l', lwd = 3, col = 'blue3', low = 0.025, up = 0.975)



