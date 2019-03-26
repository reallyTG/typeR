library(CDFt)


### Name: CDFt
### Title: Downscaling or bias correction of CDF through CDF-transformation
### Aliases: CDFt
### Keywords: math distribution nonparametric models

### ** Examples

## Example

### Generation of example data
O <- rnorm(2100,mean=0,sd=1)
Gp <- rnorm(300,mean=3,sd=1)
Gf <- rnorm(300,mean=4,sd=1)

### Call of the CDFt method
CT <- CDFt(O,Gp,Gf)

x <- CT$x
FGp <- CT$FGp
FGf <- CT$FGf
FRp <- CT$FRp
FRf <- CT$FRf
ds <- CT$DS

### Plot the results
par(mfrow=c(1,2))

plot(x, FGp,type="l",lty=2,ylim=c(0,1),xlab="x",ylab="CDF(x)")
lines(x,FGf,type="l",lty=2,col=2)
lines(x,FRp,type="l")
lines(x,FRf,type="l",col=2)

plot(Gf,ds,xlab="Large-scale data", ylab="Downscaled data")




