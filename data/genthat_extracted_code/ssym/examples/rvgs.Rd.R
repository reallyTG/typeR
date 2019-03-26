library(ssym)


### Name: rvgs
### Title: Random generation for some symmetric continuous distributions.
### Aliases: rvgs

### ** Examples

m1 <- "Standard Sinh-t distributions"
n <- 1000000
xi <- c(10,6,4)
plot(density(rvgs(n,"Sinh-t",xi=c(25,10))), xlim=c(-4.5,4.5), ylim=c(0,0.3), xlab="",
     ylab="", col=1, main="")
par(new=TRUE)
plot(density(rvgs(n,"Sinh-t",xi=c(25,6))), xlim=c(-4.5,4.5), ylim=c(0,0.3), xlab="",
     ylab="", col=2, main="")
par(new=TRUE)
plot(density(rvgs(n,"Sinh-t",xi=c(25,4))), xlim=c(-4.5,4.5), ylim=c(0,0.3), xlab="y",
     ylab="f(y)", main=m1, col=3)
legend(-4, 0.3, bty="n", legend=paste("xi = (",25,",",xi,")"), col=1:4, lty=1)



