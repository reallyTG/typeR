library(polyapost)


### Name: constrppprob
### Title: Dependent sampling from the uniform distribution on a polytope.
### Aliases: constrppprob
### Keywords: survey

### ** Examples

A1<-rbind(rep(1,6),1:6)
A2<-rbind(c(2,5,7,1,10,8),diag(-1,6))
A3<-matrix(c(1,1,1,0,0,0),1,6)
b1<-c(1,3.5)
b2<-c(6,rep(0,6))
b3<-0.45
initsol<-rep(1/6,6)
constrppprob(A1,A2,A3,b1,b2,b3,initsol,2000,5)



