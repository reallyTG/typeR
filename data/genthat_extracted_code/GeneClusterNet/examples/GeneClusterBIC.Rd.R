library(GeneClusterNet)


### Name: GeneClusterBIC
### Title: Optimal number of Gene Clusters
### Aliases: GeneClusterBIC

### ** Examples

 # load the package 
 library(GeneClusterNet)
 set.seed(1234)
 data(mExpression)
 Sample=mExpression[sample(1:nrow(mExpression),50,replace=FALSE),]
 GeneClusterBIC(Sample, times=c(1:18), G=c(1:5), orderLOP=5)




