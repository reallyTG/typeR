library(TSclust)


### Name: diss.COR
### Title: Correlation-based Dissimilarity
### Aliases: diss.COR
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Create three sample time series
x <- cumsum(rnorm(100))
y <- cumsum(rnorm(100))
z <- sin(seq(0, pi, length.out=100))
## Compute the distance and check for coherent results
diss.COR(x, y)
diss.COR(x, z)
#create a dist object for its use with clustering functions like pam or hclust
## Not run: 
##D diss( rbind(x,y,z), "COR")
## End(Not run)



