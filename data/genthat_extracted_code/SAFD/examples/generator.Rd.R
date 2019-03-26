library(SAFD)


### Name: generator
### Title: Simulation of fuzzy random variables (FRV)
### Aliases: generator
### Keywords: nonparametric datagen

### ** Examples

#Example:
data(XX)
V<-translator(XX[[3]],100)
YY<-vector("list",length=100)
  for(i in 1:100){
   YY[[i]]<-generator(V,,,)
   }
M<-Mmean(YY) 
plot(M,type="l",xlim=c(-3,4))
lines(V,type="l",col="red",lwd=2)



