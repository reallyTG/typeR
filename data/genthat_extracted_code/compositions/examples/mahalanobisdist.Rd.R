library(compositions)


### Name: MahalanobisDist
### Title: Compute Mahalanobis distances based von robust Estimations
### Aliases: MahalanobisDist MahalanobisDist.rmult MahalanobisDist.acomp
###   MahalanobisDist.rcomp MahalanobisDist.rplus MahalanobisDist.aplus
### Keywords: multivariate

### ** Examples

data(SimulatedAmounts)
data5 <- acomp(sa.outliers5)

  cl <- ClusterFinder1(data5,sigma=0.4,radius=1) 
  plot(data5,col=as.numeric(cl$types),pch=as.numeric(cl$types))
  legend(1,1,legend=levels(cl$types),xjust=1,col=1:length(levels(cl$types)),
             pch=1:length(levels(cl$types)))




