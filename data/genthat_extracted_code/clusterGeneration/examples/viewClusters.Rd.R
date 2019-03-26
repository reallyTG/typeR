library(clusterGeneration)


### Name: viewClusters
### Title: PLOT ALL CLUSTERS IN A 2-D PROJECTION SPACE
### Aliases: viewClusters
### Keywords: cluster

### ** Examples

n1<-50
mu1<-c(0,0)
Sigma1<-matrix(c(2,1,1,5),2,2)
n2<-100
mu2<-c(10,0)
Sigma2<-matrix(c(5,-1,-1,2),2,2)
n3<-30
mu3<-c(10,10)
Sigma3<-matrix(c(3,1.5,1.5,1),2,2)
n4<-10
mu4<-c(0,0)
Sigma4<-50*diag(2)

library(MASS)
set.seed(1234)
y1<-mvrnorm(n1, mu1, Sigma1)
y2<-mvrnorm(n2, mu2, Sigma2)
y3<-mvrnorm(n3, mu3, Sigma3)
y4<-mvrnorm(n4, mu4, Sigma4)
y<-rbind(y1, y2, y3, y4)
cl<-rep(c(1:3, 0), c(n1, n2, n3, n4))

par(mfrow=c(2,1))
viewClusters(y, cl)
viewClusters(y, cl,projMethod="DMS")




