library(concor)


### Name: concorgmcano
### Title: Canonical analysis of subsets Yj with subsets Xi
### Aliases: concorgmcano

### ** Examples

x<-matrix(runif(50),10,5);y<-matrix(runif(90),10,9)
x<-scale(x);y<-scale(y)
cc<-concorgmcano(x,c(2,3),y,c(3,2,4),2)
diag(t(cc$cx[1:10,])%*%cc$cy[1:10,]/10)^2
cc$rho2[1,1,] 



