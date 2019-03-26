library(GeneClusterNet)


### Name: GeneCluster
### Title: Clustering dynamic gene expression
### Aliases: GeneCluster

### ** Examples

 # load the package 
 library(GeneClusterNet)

 # Set the number of Cluster is 3 and order of Legendre Polynomials is 5.
 set.seed(1234)
 data(mExpression)
 
 Sample=mExpression[sample(1:nrow(mExpression),50,replace=FALSE),]

 GeneCluster(Sample, times=c(1:18), NumberOfCluster=3,orderLOP=5)





