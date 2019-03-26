library(TSclust)


### Name: diss.CORT
### Title: Dissimilarity Index Combining Temporal Correlation and Raw
###   Values Behaviors
### Aliases: diss.CORT
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Create three sample time series
x <- cumsum(rnorm(100))
y <- cumsum(rnorm(100))
z <- sin(seq(0, pi, length.out=100))
## Compute the distance and check for coherent results
diss.CORT(x, y, 2)
diss.CORT(x, z, 2)
diss.CORT(y, z, 2)
#create a dist object for its use with clustering functions like pam or hclust
## Not run: 
##D diss( rbind(x,y,z), "CORT", k=3, deltamethod="DTW")
## End(Not run)



