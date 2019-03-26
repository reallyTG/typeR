library(sde)


### Name: ksmooth
### Title: Nonparametric invariant density, drift, and diffusion
###   coefficient estimation
### Aliases: ksdrift ksdiff ksdens
### Keywords: datagen ts

### ** Examples

set.seed(123)
theta <- c(6,2,1)
X <- sde.sim(X0 = rsCIR(1, theta), model="CIR", theta=theta,
     N=1000,delta=0.1)

b <- function(x)
 theta[1]-theta[2]*x

sigma <- function(x)
 theta[3]*sqrt(x)
  
minX <- min(X)
maxX <- max(X)

par(mfrow=c(3,1))
curve(b,minX,maxX)
lines(ksdrift(X),lty=3)

curve(sigma,minX, maxX)
lines(ksdiff(X),lty=3)

f <-function(x) dsCIR(x, theta)
curve(f,minX,maxX)
lines(ksdens(X),lty=3)



