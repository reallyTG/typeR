library(lmomco)


### Name: parln3
### Title: Estimate the Parameters of the 3-Parameter Log-Normal
###   Distribution
### Aliases: parln3
### Keywords: distribution (parameters) Distribution: Log-Normal
###   (3-parameter)

### ** Examples

lmr <- lmoms(rnorm(20))
parln3(lmr)

## Not run: 
##D # Handling condition of negative L-skew
##D # Data reversal looks like: Y <- -X, but let us use an example
##D # on the L-moments themselves.
##D lmr.pos <- vec2lmom(c(100, 45, -0.1)) # parln3(lmr.pos) fails
##D lmr.neg <- lmr.pos
##D lmr.neg$lambdas[1] <- -lmr.neg$lambdas[1]
##D lmr.neg$ratios[3]  <- -lmr.neg$ratios[3]
##D F <- nonexceeds()
##D plot(F, -qualn3(1-F, parln3(lmr.neg)), type="l", lwd=3, col=2) # red line
##D lines(F, quagno(F, pargno(lmr.pos))) # black line
## End(Not run)



