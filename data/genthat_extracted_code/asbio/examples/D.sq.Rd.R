library(asbio)


### Name: D.sq
### Title: Mahalanobis distance for two sites using a pooled covariance
###   matrix
### Aliases: D.sq
### Keywords: multivariate

### ** Examples

g1<-matrix(ncol=3,nrow=3,data=c(1,0,3,2,1,3,4,0,2))
g2<-matrix(ncol=3,nrow=3,data=c(1,2,4,5,2,3,4,3,1))
D.sq(g1,g2)$D.sq
 


