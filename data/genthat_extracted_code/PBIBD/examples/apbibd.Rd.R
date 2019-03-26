library(PBIBD)


### Name: apbibd
### Title: Calculates the efficiencies of PBIB designs with any number of
###   associate classes.
### Aliases: apbibd
### Keywords: Partially Balanced Incomplete Block Designs Efficiencies
###   m-associate class PBIB Design

### ** Examples

v<-25
r<-9
k<-9
l<-c(5,2,5,2,5)
n<-c(2,8,2,8,4)
P1<-matrix(c(0,0,1,0,0,0,0,0,4,4,1,0,1,0,0,0,4,0,4,0,0,4,0,0,0),nrow=5,ncol=5)
P2<-matrix(c(0,0,0,1,1,0,0,1,3,3,0,1,0,1,0,1,3,1,3,0,1,3,0,0,0),nrow=5,ncol=5)
P3<-matrix(c(1,0,1,0,0,0,4,0,4,0,1,0,0,0,0,0,4,0,0,4,0,0,0,4,0),nrow=5,ncol=5)
P4<-matrix(c(0,1,0,1,0,1,3,1,3,0,0,1,0,0,1,1,3,0,0,3,0,0,1,3,0),nrow=5,ncol=5)
P5<-matrix(c(0,2,0,0,0,2,6,0,0,0,0,0,0,2,0,0,0,2,6,0,0,0,0,0,3),nrow=5,ncol=5)
P<-list(P1,P2,P3,P4,P5)
apbibd(v,r,k,l,n,P)



