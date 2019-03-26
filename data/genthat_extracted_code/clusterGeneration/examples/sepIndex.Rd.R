library(clusterGeneration)


### Name: sepIndex
### Title: MEASURE THE MAGNITUDE OF THE GAP OR SPARSE AREA BETWEEN A PAIR
###   OF CLUSTERS ALONG THE SPECIFIED PROJECTION DIRECTION
### Aliases: sepIndex sepIndexTheory sepIndexData
### Keywords: cluster

### ** Examples

n1<-50
mu1<-c(0,0)
Sigma1<-matrix(c(2,1,1,5),2,2)
n2<-100
mu2<-c(10,0)
Sigma2<-matrix(c(5,-1,-1,2),2,2)
projDir<-c(1, 0)
sepIndexTheory(projDir, mu1, Sigma1, mu2, Sigma2)

library(MASS)
y1<-mvrnorm(n1, mu1, Sigma1)
y2<-mvrnorm(n2, mu2, Sigma2)
sepIndexData(projDir, y1, y2)




