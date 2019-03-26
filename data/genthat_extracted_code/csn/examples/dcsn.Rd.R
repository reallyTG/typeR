library(csn)


### Name: dcsn
### Title: The probability density function
### Aliases: dcsn

### ** Examples

x1 <- seq(4.5,11,length=100)
x2 <- cbind(seq(3,9,length=100),seq(7,13,length=100))
mu <- c(5,7)
sigma <- matrix(c(1,0.2,0.2,4),2)
gamma <- matrix(c(4,0,0,5),2)
nu <- c(-2,6)
delta <- matrix(c(1,0,0,1),2)
f1 <- dcsn(x1,5,9,1,0,0.05)
f2 <- dcsn(x2, mu, sigma, gamma, nu, delta)



