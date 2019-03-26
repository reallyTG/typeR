library(concor)


### Name: concorgm
### Title: Analyzing a set of partial links between Xi and Yj
### Aliases: concorgm

### ** Examples

x<-matrix(runif(50),10,5);y<-matrix(runif(90),10,9)
x<-scale(x);y<-scale(y)
cg<-concorgm(x,c(2,3),y,c(3,2,4),2)
diag(t(x[,1:2]%*%cg$u[1:2,])%*%y[,1:3]%*%cg$v[1:3,]/10)^2
cg$cov2[1,1,]



