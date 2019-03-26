library(TSclust)


### Name: diss.SPEC.GLK
### Title: Dissimilarity based on the Generalized Likelihood Ratio Test
### Aliases: diss.SPEC.GLK
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Create two sample time series
x <- cumsum(rnorm(50))
y <- cumsum(rnorm(50))
z <- sin(seq(0, pi, length.out=50))
## Compute the distance and check for coherent results
diss.SPEC.GLK(x, y, plot=TRUE)
#create a dist object for its use with clustering functions like pam or hclust
## Not run: 
##D diss( rbind(x,y,z), "SPEC.GLK" )
## End(Not run)



