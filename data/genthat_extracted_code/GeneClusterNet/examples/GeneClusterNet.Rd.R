library(GeneClusterNet)


### Name: GeneClusterNet
### Title: Inference of gene regulatory network
### Aliases: GeneClusterNet

### ** Examples

 # load the package 
 library(GeneClusterNet)
 set.seed(1234)
 data(mExpression)
 Sample=mExpression[sample(1:nrow(mExpression),50,replace=FALSE),]
 GeneClusterNet (Sample, times=c(1:18), orderLOP=5 ,alpha1=0.5, alpha2=0.05,NumberOfCluster = 3)




