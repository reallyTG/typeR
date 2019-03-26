library(fda)


### Name: density.fd
### Title: Compute a Probability Density Function
### Aliases: density.fd
### Keywords: smooth

### ** Examples


#  set up range for density
rangeval <- c(-3,3)
#  set up some standard normal data
x <- rnorm(50)
#  make sure values within the range
x[x < -3] <- -2.99
x[x >  3] <-  2.99
#  set up basis for W(x)
basisobj <- create.bspline.basis(rangeval, 11)
#  set up initial value for Wfdobj
Wfd0 <- fd(matrix(0,11,1), basisobj)
WfdParobj <- fdPar(Wfd0)
#  estimate density
denslist <- density.fd(x, WfdParobj)
#  plot density
xval <- seq(-3,3,.2)
wval <- eval.fd(xval, denslist$Wfdobj)
pval <- exp(wval)/denslist$C
plot(xval, pval, type="l", ylim=c(0,0.4))
points(x,rep(0,50))




