library(rv)


### Name: rvbinom
### Title: Generate Random Variables from a Binomial Sampling Model
### Aliases: rvbinom
### Keywords: classes

### ** Examples

## Not run: 
##D 
##D   s <- 1 + rvpois(1, lambda=3)        # A prior distribution on the 'size' parameter.
##D   rvbinom(1, size=s, prob=0.5)     # The 'size' is random.
##D   p <- rvbinom(1, 10, prob=0.5)/10 # Prior probability of success.
##D   rvbinom(1, size=10, prob=p)      # Now the probability is random.
##D   rvbinom(1, size=s, prob=p)       # Both the size and the probability are random.
##D   
## End(Not run)




