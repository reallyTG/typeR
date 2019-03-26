library(TSclust)


### Name: diss.INT.PER
### Title: Integrated Periodogram Based Dissimilarity
### Aliases: diss.INT.PER
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Create three sample time series
x <- cumsum(rnorm(100))
y <- cumsum(rnorm(100))
z <- sin(seq(0, pi, length.out=100))
## Compute the distance and check for coherent results
diss.INT.PER(x, y, normalize=TRUE)
diss.INT.PER(x, y, normalize=TRUE)
diss.INT.PER(x, y, normalize=TRUE)
## Not run: 
##D diss( rbind(x,y,z), "INT.PER", normalize=FALSE )
## End(Not run)



