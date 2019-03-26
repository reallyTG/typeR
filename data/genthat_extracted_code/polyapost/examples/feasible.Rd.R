library(polyapost)


### Name: feasible
### Title: Feasible solution for a probability distribution which must
###   satisfy a system of linear equality and inequality constraints.
### Aliases: feasible
### Keywords: survey

### ** Examples

A1<-rbind(rep(1,7),1:7)
b1<-c(1,4)
A2<-rbind(c(1,1,1,1,0,0,0),c(.2,.4,.6,.8,1,1.2,1.4))
b2<-c(1,2)
A3<-rbind(c(1,3,5,7,9,10,11),c(1,1,1,0,0,0,1))
b3<-c(5,.5)
eps<-1/100
feasible(A1,A2,A3,b1,b2,b3,eps)



