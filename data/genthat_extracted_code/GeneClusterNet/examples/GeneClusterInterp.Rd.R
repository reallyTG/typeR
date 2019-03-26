library(GeneClusterNet)


### Name: GeneClusterInterp
### Title: Interpolating gene expression measurements
### Aliases: GeneClusterInterp

### ** Examples

 # load the package 
 library(GeneClusterNet)
 set.seed(1234)
 data(mExpression)
 Sample=mExpression[sample(1:nrow(mExpression),50,replace=FALSE),]
 LOPCoefficient =GeneCluster (Sample, times=c(1:18), NumberOfCluster=3,orderLOP=5)$ LOPCoefficient
 GeneClusterInterp (LOPCoefficient, OriginalTime=c(1:18),outLen=20)





