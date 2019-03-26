library(FIACH)


### Name: basisFunctions
### Title: Informed basis set
### Aliases: basisFunctions

### ** Examples

RT=1/16
basis<-basisFunctions(RT=RT)
basis<-basis/max(basis)
x<-seq(0,32,RT)
ylim<-c(min(basis)-sd(basis),max(basis)+sd(basis))
plot(x,basis[,1],lwd=7,col="red",type="l",
      main="Informed Basis Set",xlab="Time(seconds)",
      ylab="Intensity(A.U.)",ylim=ylim)
      
y<-seq(min(ylim),max(ylim),length.out=10)
abline(h=y,col="grey")
legend(x="topright",                                 
       legend=c("Canonical HRF",
                "Temporal Derivative",
                "Dispersion Derivative"),
       col=c("red","blue","green"),lwd=2)
lines(x,basis[,1],lwd=7,col="red")
lines(x,basis[,2],lwd=7,col="blue")
lines(x,basis[,3],lwd=7,col="green")




