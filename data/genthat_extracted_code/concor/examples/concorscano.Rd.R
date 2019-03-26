library(concor)


### Name: concorscano
### Title: "simultaneous concorgmcano"
### Aliases: concorscano

### ** Examples

x<-matrix(runif(50),10,5);y<-matrix(runif(90),10,9)
x<-scale(x);y<-scale(y)
cca<-concorscano(x,c(2,3),y,c(3,2,4),2)
diag(t(cca$cx[1:10,])%*%cca$cy[1:10,]/10)^2
cca$rho2[1,1,]



