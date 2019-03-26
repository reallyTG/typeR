library(TSclust)


### Name: diss.PER
### Title: Periodogram Based Dissimilarity
### Aliases: diss.PER
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Create three sample time series
x <- cumsum(rnorm(100))
y <- cumsum(rnorm(100))
z <- sin(seq(0, pi, length.out=100))
## Compute the distance and check for coherent results
diss.PER(x, y)
diss.PER(x, z)
diss.PER(y, z)
diss.PER(x, y, TRUE, TRUE)
diss.PER(x, z, TRUE, TRUE)
diss.PER(y, z, TRUE, TRUE)
#create a dist object for its use with clustering functions like pam or hclust
diss( rbind(x,y,z), "PER", logarithm=TRUE, normalize=TRUE)



