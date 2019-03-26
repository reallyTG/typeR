library(concor)


### Name: concorgmreg
### Title: Regression of subsets Yj by subsets Xi
### Aliases: concorgmreg

### ** Examples

x<-matrix(runif(50),10,5);y<-matrix(runif(90),10,9)
x<-scale(x);y<-scale(y)
cr<-concorgmreg(x,c(2,3),y,c(3,2,4),2)
diag(t(cr$cx[1:10,])%*%y[,1:3]%*%cr$v[1:3,]/10)^2
cr$varexp[1,1,]



