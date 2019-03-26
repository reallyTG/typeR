library(vegan)


### Name: cascadeKM
### Title: K-means partitioning using a range of values of K
### Aliases: cascadeKM cIndexKM plot.cascadeKM orderingKM pregraphKM
### Keywords: cluster

### ** Examples

 # Partitioning a (10 x 10) data matrix of random numbers
 mat <- matrix(runif(100),10,10)
 res <- cascadeKM(mat, 2, 5, iter = 25, criterion = 'calinski') 
 toto <- plot(res)
 
 # Partitioning an autocorrelated time series
 vec <- sort(matrix(runif(30),30,1))
 res <- cascadeKM(vec, 2, 5, iter = 25, criterion = 'calinski')
 toto <- plot(res)
 
 # Partitioning a large autocorrelated time series
 # Note that we remove the grid lines
 vec <- sort(matrix(runif(1000),1000,1))
 res <- cascadeKM(vec, 2, 7, iter = 10, criterion = 'calinski')
 toto <- plot(res, gridcol=NA)
 



