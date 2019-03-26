library(mcsm)


### Name: rdirichlet
### Title: Dirichlet generator
### Aliases: rdirichlet
### Keywords: distribution

### ** Examples

A=rdirichlet(10^3,rep(.5,5))
hist(A[,1],fre=FALSE,col="grey",nclass=123,xlim=c(0,1),
main="",xlab=expression(p[1]))
curve(dbeta(x,.5,4*.5),add=TRUE,col="sienna",lwd=2)



