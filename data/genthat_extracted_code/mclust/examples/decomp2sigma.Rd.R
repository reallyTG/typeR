library(mclust)


### Name: decomp2sigma
### Title: Convert mixture component covariances to matrix form.
### Aliases: decomp2sigma
### Keywords: cluster

### ** Examples

meEst <- meVEV(iris[,-5], unmap(iris[,5])) 
names(meEst)
meEst$parameters$variance

dec <- meEst$parameters$variance
decomp2sigma(d=dec$d, G=dec$G, shape=dec$shape, scale=dec$scale,
             orientation = dec$orientation)
## Not run: 
##D do.call("decomp2sigma", dec)  ## alternative call
## End(Not run)



