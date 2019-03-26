library(ks)


### Name: kde.boundary
### Title: Kernel density estimate for bounded data
### Aliases: kde.boundary
### Keywords: smooth

### ** Examples

data(worldbank)
wb <- as.matrix(na.omit(worldbank[,c("internet", "ag.value")]))
fhat <- kde(x=wb)
fhat.beta <- kde.boundary(x=wb, xmin=c(0,0), xmax=c(100,100), boundary.kernel="beta")  
fhat.LB <- kde.boundary(x=wb, xmin=c(0,0), xmax=c(100,100), boundary.kernel="linear")

plot(fhat, xlim=c(0,100), ylim=c(0,100))
plot(fhat.beta, add=TRUE, col=2)
rect(0,0,100,100, lty=2)
plot(fhat, xlim=c(0,100), ylim=c(0,100))
plot(fhat.LB, add=TRUE, col=3)
rect(0,0,100,100, lty=2) 



