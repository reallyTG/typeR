library(acid)


### Name: gini.den
### Title: Gini Coefficient for an Income Distribution
### Aliases: gini.den

### ** Examples

mu<-2
sigma<-1
incs<-c(seq(0,500,by=0.01),seq(501,50000,by=1))
dens<-dLOGNO(incs,mu,sigma)
plot(incs,dens,type="l",xlim=c(0,100))
gini.den(incs=incs,dens=dens)$Gini
gini(rLOGNO(5000000,mu,sigma))$Gini
2*pnorm(sigma/sqrt(2))-1 #theoretical Gini



