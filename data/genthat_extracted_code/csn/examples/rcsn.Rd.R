library(csn)


### Name: rcsn
### Title: Random number generation
### Aliases: rcsn

### ** Examples

mu <- c(1,2,3)
sigma <- matrix(c(2,-1,0,-1,2,-1,0,-1,2),3)
gamma <- matrix(c(0,1,0,2,2,3),2,3)
nu <- c(1,3)
delta <- matrix(c(1,1,1,2),2)
x1 <- rcsn(100, mu, sigma, gamma, nu, delta)
x2 <- rcsn(100,5,9,1,0,0.05)



