library(TSclust)


### Name: pvalues.clust
### Title: Clustering Algorithm Based on p-values.
### Aliases: pvalues.clust
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Create three sample time series
x <- cumsum(rnorm(100))
y <- cumsum(rnorm(100))
z <- sin(seq(0, pi, length.out=100))
##

## Compute the distance and check for coherent results
dd <- diss( rbind(x,y,z), "AR.MAH")
pvalues.clust( dd$p_value, 0.05 )




