library(mclust)


### Name: mclust1Dplot
### Title: Plot one-dimensional data modeled by an MVN mixture.
### Aliases: mclust1Dplot
### Keywords: cluster

### ** Examples

## Not run: 
##D n <- 250 ## create artificial data
##D set.seed(1)
##D y <- c(rnorm(n,-5), rnorm(n,0), rnorm(n,5))
##D yclass <- c(rep(1,n), rep(2,n), rep(3,n))
##D 
##D yModel <- Mclust(y)
##D 
##D mclust1Dplot(y, parameters = yModel$parameters, z = yModel$z, 
##D              what = "classification", main = TRUE)
##D 
##D mclust1Dplot(y, parameters = yModel$parameters, z = yModel$z, 
##D              truth = yclass, what = "errors", main = TRUE)
##D 
##D mclust1Dplot(y, parameters = yModel$parameters, z = yModel$z, 
##D              what = "density", main = TRUE)
##D 
##D mclust1Dplot(y, z = yModel$z, parameters = yModel$parameters,
##D             what = "uncertainty", main = TRUE)
##D 
## End(Not run)



