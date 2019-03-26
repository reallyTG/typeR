library(ClassDiscovery)


### Name: GenePCA
### Title: Class "GenePCA"
### Aliases: GenePCA GenePCA-class plot,GenePCA,missing-method
### Keywords: algebra array classes multivariate

### ** Examples

showClass("GenePCA")

## simulate samples from three different groups, with generic genes
d1 <- matrix(rnorm(100*10, rnorm(100, 0.5)), nrow=100, ncol=10, byrow=FALSE)
d2 <- matrix(rnorm(100*10, rnorm(100, 0.5)), nrow=100, ncol=10, byrow=FALSE)
d3 <- matrix(rnorm(100*10, rnorm(100, 0.5)), nrow=100, ncol=10, byrow=FALSE)
dd <- cbind(d1, d2, d3)

## perform PCA in gene space
gpc <- GenePCA(dd)

## plot the results
plot(gpc)

## cleanup
rm(d1, d2, d3, dd, gpc)



