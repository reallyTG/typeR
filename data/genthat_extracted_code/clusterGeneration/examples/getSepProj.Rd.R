library(clusterGeneration)


### Name: getSepProj
### Title: OPTIMAL PROJECTION DIRECTION AND CORRESPONDING SEPARATION INDEX
###   FOR PAIRS OF CLUSTERS
### Aliases: getSepProj getSepProjTheory getSepProjData
### Keywords: cluster

### ** Examples

n1<-50
mu1<-c(0,0)
Sigma1<-matrix(c(2,1,1,5),2,2)
n2<-100
mu2<-c(10,0)
Sigma2<-matrix(c(5,-1,-1,2),2,2)
projDir<-c(1, 0)
muMat<-rbind(mu1, mu2)
SigmaArray<-array(0, c(2,2,2))
SigmaArray[,,1]<-Sigma1
SigmaArray[,,2]<-Sigma2

a<-getSepProjTheory(muMat, SigmaArray, iniProjDirMethod="SL")
# separation index for cluster distributions 1 and 2
a$sepValMat[1,2]
# projection direction for cluster distributions 1 and 2
a$projDirArray[1,2,]

library(MASS)
y1<-mvrnorm(n1, mu1, Sigma1)
y2<-mvrnorm(n2, mu2, Sigma2)
y<-rbind(y1, y2)
cl<-rep(1:2, c(n1, n2))

b<-getSepProjData(y, cl, iniProjDirMethod="SL", projDirMethod="newton")
# separation index for clusters 1 and 2
b$sepValMat[1,2]
# projection direction for clusters 1 and 2
b$projDirArray[1,2,]




