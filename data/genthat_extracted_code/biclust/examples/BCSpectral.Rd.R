library(biclust)


### Name: BCSpectral
### Title: The Spectral Bicluster algorithm
### Aliases: BCSpectral spectral 'spectral biclustering' 'Kluger
###   biclustering' BCSpectral-class biclust,matrix,BCSpectral-method
### Keywords: cluster multivariate

### ** Examples

  #Random matrix with embedded bicluster  
  test <- matrix(rnorm(5000),100,50)
  test[11:20,11:20] <- rnorm(100,10,0.1)
  res1 <- biclust(test, method=BCSpectral(), numberOfEigenvalues=1)
  res1
  


