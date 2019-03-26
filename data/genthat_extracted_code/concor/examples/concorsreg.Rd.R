library(concor)


### Name: concorsreg
### Title: "simultaneous concorgmreg"
### Aliases: concorsreg

### ** Examples

x<-matrix(runif(50),10,5);y<-matrix(runif(90),10,9)
x<-scale(x);y<-scale(y)
crs<-concorsreg(x,c(2,3),y,c(3,2,4),2)
diag(t(crs$cx[1:10,])%*%y[,1:3]%*%crs$v[1:3,]/10)^2
crs$varexp[1,1,]



