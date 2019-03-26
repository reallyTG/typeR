library(portes)


### Name: vma.sim
### Title: Compute The Vector of Moving Average Model (VMA)
### Aliases: vma.sim
### Keywords: ts

### ** Examples

k <- 2
n <- 300
trunc.lag <-  50   
phi <-  array(c(0.5,0.4,0.1,0.5),dim=c(k,k,1))
theta <-  array(c(0,0.25,0,0),dim=c(k,k,1))
sigma <- matrix(c(1,0.71,0.71,2),k,k)
p <- ifelse(is.null(phi),0,dim(phi)[3])
q <- ifelse(is.null(theta),0,dim(theta)[3])
r <- max(p, q)
d <- trunc.lag + r
psi <- ImpulseVMA(phi = phi, theta = theta, trunc.lag = trunc.lag)
a <- t(crossprod(chol(sigma),matrix(rnorm(k*d),ncol=d)))
vma.sim(psi = psi, a = a)



