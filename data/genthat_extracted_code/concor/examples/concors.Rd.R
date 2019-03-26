library(concor)


### Name: concors
### Title: "simultaneous concorgm"
### Aliases: concors

### ** Examples

x<-matrix(runif(50),10,5);y<-matrix(runif(90),10,9)
x<-scale(x);y<-scale(y)
cs<-concors(x,c(2,3),y,c(3,2,4),2)
diag(t(x[,1:2]%*%cs$u[1:2,])%*%y[,1:3]%*%cs$v[1:3,]/10)^2
cs$cov2[1,1,]



