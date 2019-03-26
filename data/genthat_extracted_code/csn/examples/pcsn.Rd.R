library(csn)


### Name: pcsn
### Title: The cumulative distribution function
### Aliases: pcsn

### ** Examples

x1 <- seq(4,6,by = 0.1)
x2 <- x1+sin(x1)
x3 <- x1-cos(x1)
x <- cbind(x1,x2,x3)
mu <- c(1,2,3)
sigma <- matrix(c(2,-1,0,-1,2,-1,0,-1,2),3)
gamma <- matrix(c(0,1,0,2,2,3),2,3)
nu <- c(1,3)
delta <- matrix(c(1,1,1,2),2)
pcsn(6,5,9,1,0,0.05)
pcsn(c(3,4,5),mu,sigma,gamma,nu,delta)
pcsn(x,mu,sigma,gamma,nu,delta)



