library(TSclust)


### Name: diss.ACF
### Title: Autocorrelation-based Dissimilarity
### Aliases: diss.ACF diss.PACF
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Create three sample time series
x <- cumsum(rnorm(100))
y <- cumsum(rnorm(100))
z <- sin(seq(0, pi, length.out=100))
## Compute the distance and check for coherent results
diss.PACF(x, y)
diss.ACF(x, z)
diss.PACF(y, z)
#create a dist object for its use with clustering functions like pam or hclust
diss( rbind(x,y,z), "ACF", p=0.05)




