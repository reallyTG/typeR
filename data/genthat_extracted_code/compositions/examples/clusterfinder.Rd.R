library(compositions)


### Name: ClusterFinder1
### Title: Heuristics to find subpopulations of outliers
### Aliases: ClusterFinder1 ClusterFinder1.acomp
### Keywords: cluster

### ** Examples

data(SimulatedAmounts)
  cl <- ClusterFinder1(sa.outliers5,sigma=0.4,radius=1) 
  plot(sa.outliers5,col=as.numeric(cl$types),pch=as.numeric(cl$types))
  legend(1,1,legend=levels(cl$types),xjust=1,col=1:length(levels(cl$types)),
                     pch=1:length(levels(cl$types)))




