library(dimRed)


### Name: LaplacianEigenmaps-class
### Title: Laplacian Eigenmaps
### Aliases: LaplacianEigenmaps-class LaplacianEigenmaps

### ** Examples

dat <- loadDataSet("3D S Curve")
leim <- LaplacianEigenmaps()
emb <- leim@fun(dat, leim@stdpars)


plot(emb@data@data)





