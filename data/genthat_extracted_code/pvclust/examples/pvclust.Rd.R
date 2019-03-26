library(pvclust)


### Name: pvclust
### Title: Calculating P-values for Hierchical Clustering
### Aliases: pvclust parPvclust
### Keywords: cluster

### ** Examples

### example using Boston data in package MASS
data(Boston, package = "MASS")

## multiscale bootstrap resampling (non-parallel)
boston.pv <- pvclust(Boston, nboot=100, parallel=FALSE)

## CAUTION: nboot=100 may be too small for actual use.
##          We suggest nboot=1000 or larger.
##          plot/print functions will be useful for diagnostics.

## plot dendrogram with p-values
plot(boston.pv)

ask.bak <- par()$ask
par(ask=TRUE)

## highlight clusters with high au p-values
pvrect(boston.pv)

## print the result of multiscale bootstrap resampling
print(boston.pv, digits=3)

## plot diagnostic for curve fitting
msplot(boston.pv, edges=c(2,4,6,7))

par(ask=ask.bak)

## print clusters with high p-values
boston.pp <- pvpick(boston.pv)
boston.pp

### Using a custom distance measure

## Define a distance function which returns an object of class "dist".
## The function must have only one argument "x" (data matrix or data.frame).
cosine <- function(x) {
    x <- as.matrix(x)
    y <- t(x) %*% x
    res <- 1 - y / (sqrt(diag(y)) %*% t(sqrt(diag(y))))
    res <- as.dist(res)
    attr(res, "method") <- "cosine"
    return(res)
}

result <- pvclust(Boston, method.dist=cosine, nboot=100)
plot(result)

## Not run: 
##D ### parallel computation
##D result.par <- pvclust(Boston, nboot=1000, parallel=TRUE)
##D plot(result.par)
## End(Not run)




