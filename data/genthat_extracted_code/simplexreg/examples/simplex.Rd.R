library(simplexreg)


### Name: simplex
### Title: The Simplex Distribution Functions
### Aliases: dsimplex psimplex qsimplex rsimplex psimplex.norm
###   qsimplex.norm
### Keywords: distribution random variable

### ** Examples

# simplex distribution function
dsimplex(seq(0.01,0.99,0.01), 0.5, 1)
psimplex(seq(0.01,0.99,0.01), 0.5, 1)
qsimplex(seq(0.01,0.99,0.01), 0.5, 1)

# random variable generation
n <- 200
ga0 <- 1.5
ga1 <- 0.5
ga2 <- -0.5
sigma <- 4
T <- c(rep(0, n/2), rep(1, n/2))
S <- runif(n, 0, 5)
eta <- ga0 + ga1 * T + ga2 * S
mu <- exp(eta)/(1+exp(eta))
Y <- rep(0, n)
for (i in 1:n){ 
  Y[i] <- rsimplex(1, mu[i], sigma)
}



