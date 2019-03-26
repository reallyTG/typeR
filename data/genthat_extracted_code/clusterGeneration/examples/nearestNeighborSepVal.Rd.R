library(clusterGeneration)


### Name: nearestNeighborSepVal
### Title: SEPARATON INFORMATION MATRIX
### Aliases: nearestNeighborSepVal
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

projDir<-c(1, 0)
muMat<-rbind(mu1, mu2, mu3)
SigmaArray<-array(0, c(2,2,3))
SigmaArray[,,1]<-Sigma1
SigmaArray[,,2]<-Sigma2
SigmaArray[,,3]<-Sigma3

tmp<-getSepProjTheory(muMat, SigmaArray, iniProjDirMethod="SL")
sepValMat<-tmp$sepValMat
nearestNeighborSepVal(sepValMat)



