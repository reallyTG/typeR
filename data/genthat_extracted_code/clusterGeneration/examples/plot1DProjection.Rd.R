library(clusterGeneration)


### Name: plot1DProjection
### Title: PLOT A PAIR OF CLUSTERS AND THEIR DENSITY ESTIMATES, WHICH ARE
###   PROJECTED ALONG A SPECIFIED 1-D PROJECTION DIRECTION
### Aliases: plot1DProjection
### Keywords: cluster

### ** Examples

n1<-50
mu1<-c(0,0)
Sigma1<-matrix(c(2,1,1,5),2,2)
n2<-100
mu2<-c(10,0)
Sigma2<-matrix(c(5,-1,-1,2),2,2)
projDir<-c(1, 0)

library(MASS)
set.seed(1234)
y1<-mvrnorm(n1, mu1, Sigma1)
y2<-mvrnorm(n2, mu2, Sigma2)
y<-rbind(y1, y2)
cl<-rep(1:2, c(n1, n2))

b<-getSepProjData(y, cl, iniProjDirMethod="SL", projDirMethod="newton")
# projection direction for clusters 1 and 2
projDir<-b$projDirArray[1,2,]

plot1DProjection(y1, y2, projDir)




