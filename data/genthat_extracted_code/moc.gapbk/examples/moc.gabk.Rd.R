library(moc.gapbk)


### Name: moc.gabk
### Title: Perform the Multi-Objective Clustering Algorithm Guided by
###   a-Priori Biological Knowledge (MOC-GaPBK)
### Aliases: moc.gabk
### Keywords: Crowding GaPBK NSGA-II Pareto Xie-Beni distance index ranking
###   validity

### ** Examples


##Generates a data matrix of dimension 50X20

library("amap")
library("moc.gapbk")

x <- matrix(runif(100*20, min = -5, max = 10), nrow=50, ncol=20)

##Compute two distance matrices

dmatrix1<- as.matrix(amap::Dist(x, method = "euclidean"))
dmatrix2<- as.matrix(amap::Dist(x, method = "correlation"))

##Performs MOC-GaPBK with 5 cluster

example<-moc.gabk(dmatrix1, dmatrix2, 5)

example$population
example$matrix.solutions
example$clustering




