library(multicon)


### Name: inner.outer
### Title: Comparing Within-set and Between-set Correlations
### Aliases: inner.outer
### Keywords: Factor Structure

### ** Examples


# We can generate some random data by first creating a population correlation matrix
sig <- matrix(c(1.00, .4, .6, .05, .1, -.05, .4, 1.00, .5, .08, 
	-.02, .03, .6, .5, 1.00, .09, .1, -.07,.05, .08, .09, 1.00, .6, .7, .1, 
	-.02, .1, .6, 1.00, .5, -.05, .03, -.07, .7, .5, 1.00), ncol=6, byrow=TRUE)
sig
library(mvtnorm)
# Now create random data based on this population matrix
d <- rmvnorm(100, sigma=sig)
#Create a list indicating the items belonging to each set
L <- list(d[,1:3], d[,4:6])
#Now use inner.outer on that list
inner.outer(L)





