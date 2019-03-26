library(csn)


### Name: loglcsn
### Title: The log-likelihood function
### Aliases: loglcsn

### ** Examples

x <- cbind(seq(3,9,length=100),seq(7,13,length=100))
mu <- c(5,7)
sigma <- matrix(c(1,0.2,0.2,4),2)
gamma <- matrix(c(4,0,0,5),2)
nu <- c(-2,6)
delta <- matrix(c(1,0,0,1),2)
L <- loglcsn(x, mu, sigma, gamma, nu, delta)



