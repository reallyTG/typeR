library(Kernelheaping)


### Name: dclass
### Title: Kernel density estimation for classified data
### Aliases: dclass

### ** Examples

x=rlnorm(500, meanlog = 8, sdlog = 1)
classes <- c(0,500,1000,1500,2000,2500,3000,4000,5000,6000,8000,10000,15000,Inf)
xclass <- cut(x,breaks=classes)
densityEst <- dclass(xclass=xclass, classes=classes, burnin=100, samples=200, evalpoints=1000)
hist(densityEst$xclass,breaks=densityEst$classes)
lines(densityEst$Mestimates~densityEst$gridx,col="purple",lwd=2)



