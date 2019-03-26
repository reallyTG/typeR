library(spgwr)


### Name: gwr.sel
### Title: Crossvalidation of bandwidth for geographically weighted
###   regression
### Aliases: gwr.sel gwr.cv.f gwr.cv.adapt.f gwr.aic.f gwr.aic.adapt.f
### Keywords: spatial

### ** Examples

data(columbus, package="spData")
gwr.sel(CRIME ~ INC + HOVAL, data=columbus,
  coords=cbind(columbus$X, columbus$Y))
gwr.sel(CRIME ~ INC + HOVAL, data=columbus,
  coords=cbind(columbus$X, columbus$Y), gweight=gwr.bisquare)
## Not run: 
##D data(georgia)
##D set.seed(1)
##D X0 <- runif(nrow(gSRDF)*3)
##D X1 <- matrix(sample(X0), ncol=3)
##D X1 <- prcomp(X1, center=FALSE, scale.=FALSE)$x
##D gSRDF$X1 <- X1[,1]
##D gSRDF$X2 <- X1[,2]
##D gSRDF$X3 <- X1[,3]
##D yrn <- rnorm(nrow(gSRDF))
##D gSRDF$yrn <- sample(yrn)
##D bw <- gwr.sel(yrn ~ X1 + X2 + X3, data=gSRDF, method="cv", adapt=FALSE, verbose=FALSE)
##D bw
##D bw <- gwr.sel(yrn ~ X1 + X2 + X3, data=gSRDF, method="aic", adapt=FALSE, verbose=FALSE)
##D bw
##D bw <- gwr.sel(yrn ~ X1 + X2 + X3, data=gSRDF, method="cv", adapt=TRUE, verbose=FALSE)
##D bw
##D bw <- gwr.sel(yrn ~ X1 + X2 + X3, data=gSRDF, method="aic", adapt=TRUE, verbose=FALSE)
##D bw
## End(Not run)



