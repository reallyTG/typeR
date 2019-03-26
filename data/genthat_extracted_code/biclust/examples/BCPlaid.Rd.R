library(biclust)


### Name: BCPlaid
### Title: The Plaid Model Bicluster algorithm
### Aliases: BCPlaid plaid 'plaid model' BCPlaid BCPlaid-class 'turner
###   biclustering' biclust,matrix,BCPlaid-method
### Keywords: cluster classif models

### ** Examples

  #Random matrix with embedded bicluster
  test <- matrix(rnorm(5000),100,50)
  test[11:20,11:20] <- rnorm(100,3,0.3)
  res<-biclust(test, method=BCPlaid())
  res

  #microarray matrix
  data(BicatYeast)
  res<-biclust(BicatYeast, method=BCPlaid(), verbose=FALSE)
  res
  


