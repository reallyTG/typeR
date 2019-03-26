library(PBIBD)


### Name: verify
### Title: Verifies all the necessary conditions for the existence of PBIB
###   designs based on any association scheme.
### Aliases: verify
### Keywords: Partially Balanced Incomplete Block Designs m-associate class
###   Association Scheme Necessary conditions

### ** Examples

v<-12
b<-12
r<-5
k<-5
l<-c(1,2,2)
n<-c(2,3,6)
P1<-matrix(c(1,0,0,0,0,3,0,3,3),nrow=3,ncol=3)
P2<-matrix(c(0,0,2,0,2,0,2,0,4),nrow=3,ncol=3)
P3<-matrix(c(0,1,1,1,0,2,1,2,2),nrow=3,ncol=3)
P<-list(P1,P2,P3)
verify(v,b,r,k,l,n,P)



