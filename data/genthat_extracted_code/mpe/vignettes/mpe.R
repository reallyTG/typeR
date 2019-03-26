## ------------------------------------------------------------------------
library(mpe)
Sigma <- matrix(c(1, 0.8, 0.8, 1), nrow = 2)
power.known.var(K = 2, delta = c(0.25, 0.4), Sigma = Sigma, sig.level = 0.025, power = 0.8)

## ------------------------------------------------------------------------
## equivalent: known SDs and correlation rho
power.known.var(K = 2, delta = c(0.25, 0.4), SD = c(1,1), rho = 0.8, sig.level = 0.025, 
                power = 0.8)


## ------------------------------------------------------------------------
power.known.var(K = 2, n = 252, delta = c(0.25,0.4), Sigma=Sigma, sig.level = 0.025)

## ------------------------------------------------------------------------
## equivalent: known SDs and correlation rho
power.known.var(K = 2, n = 252, delta = c(0.25, 0.4), SD = c(1,1), rho = 0.8, 
                sig.level = 0.025)


## ------------------------------------------------------------------------
## effect size
delta <- c(0.25, 0.5)
## covariance matrix
Sigma <- matrix(c(1, 0.75, 0.75, 1), ncol = 2)
## sample size
n <- 50
## generate random data from multivariate normal distributions
X <- rmvnorm(n=n, mean = delta, sigma = Sigma)
Y <- rmvnorm(n=n, mean = rep(0, length(delta)), sigma = Sigma)
## perform multivariate z-test
mpe.z.test(X = X, Y = Y, Sigma = Sigma)

## ------------------------------------------------------------------------
Sigma <- matrix(c(1, 0.5, 0.5, 1), nrow = 2)
power.known.var(K = 2, delta = c(0.5, 0.4), Sigma = Sigma, sig.level = 0.025, power = 0.8)

## ------------------------------------------------------------------------
Sigma <- matrix(c(1, 0.5, 0.5, 1), nrow = 2)
power.unknown.var(K = 2, delta = c(0.5, 0.4), Sigma = Sigma, sig.level = 0.025, power = 0.8, 
                  min.n = 105, max.n = 120)


## ------------------------------------------------------------------------
##equivalent: known SDs and correlation rho
Sigma <- matrix(c(1, 0.5, 0.5, 1), nrow = 2)
power.unknown.var(K = 2, delta = c(0.5, 0.4), rho = 0.5, SD = c(1,1), sig.level = 0.025, 
                  power = 0.8, min.n = 105, max.n = 120)


## ------------------------------------------------------------------------
power.unknown.var(K = 2, n = 107, delta = c(0.5,0.4), Sigma = matrix(c(1, 0.5,0.5, 1), nrow=2), 
                  sig.level = 0.025)


## ------------------------------------------------------------------------
## effect size
delta <- c(0.5, 0.4)
## covariance matrix
Sigma <- matrix(c(1, 0.5, 0.5, 1), ncol = 2)
## sample size
n <- 106
## generate random data from multivariate normal distributions
X <- rmvnorm(n=n, mean = delta, sigma = Sigma)
Y <- rmvnorm(n=n, mean = rep(0, length(delta)), sigma = Sigma)
## perform multivariate t-test
mpe.t.test(X = X, Y = Y)

## ------------------------------------------------------------------------
atleast.one.endpoint(K = 2, delta = c(0.20,0.30),  Sigma = matrix(c(1, 0.3, 0.3, 1), nrow = 2),
                     power = 0.8, sig.level = 0.025)


## ------------------------------------------------------------------------
##equivalent: known SDs and correlation rho
atleast.one.endpoint(K = 2, delta = c(0.20, 0.30), SD = c(1,1), rho = 0.3,  power = 0.8)


## ------------------------------------------------------------------------
atleast.one.endpoint(K = 2, n = 147, delta = c(0.20,0.30),  
                     Sigma = matrix(c(1, 0.3, 0.3, 1), nrow = 2))


## ------------------------------------------------------------------------
## correlation = 0.0,0.3,0.5,0.8
power.known.var(K = 2,delta = c(0.47, 0.48), Sigma = matrix(c(1, 0.0, 0.0, 1), nrow = 2), 
                sig.level = 0.025, power = 0.8)

power.known.var(K= 2,delta = c(0.47, 0.48), Sigma = matrix(c(1, 0.3, 0.3, 1), nrow = 2), 
                sig.level = 0.025, power = 0.8)

power.known.var(K = 2,delta = c(0.47, 0.48), Sigma = matrix(c(1, 0.5, 0.5, 1), nrow = 2), 
                sig.level = 0.025, power = 0.8)

power.known.var(K = 2, delta = c(0.47, 0.48), Sigma = matrix(c(1, 0.8, 0.8, 1), nrow = 2), 
                sig.level = 0.025, power = 0.8)


## ------------------------------------------------------------------------

power.known.var(K = 3, delta = c(0.36, 0.30, 0.26),
                Sigma = matrix(c(1, 0.3, 0.3, 0.3, 1, 0.3, 0.3, 0.3, 1), nrow = 3),
                sig.level = 0.025, power = 0.8)


## ------------------------------------------------------------------------
power.unknown.var(K = 3, delta = c(0.36, 0.30, 0.26),
                Sigma = matrix(c(1, 0.3, 0.3, 0.3, 1, 0.3, 0.3, 0.3, 1), nrow = 3), 
                sig.level = 0.025, power = 0.8, min.n = 268, max.n = 300)


## ------------------------------------------------------------------------
atleast.one.endpoint(K= 2, delta = c(0.47, 0.48), Sigma = matrix(c(1, 0.0, 0.0, 1), nrow = 2), 
                     power = 0.8)

atleast.one.endpoint(K= 2, delta = c(0.47, 0.48), Sigma = matrix(c(1, 0.3, 0.3, 1), nrow = 2), 
                     power = 0.8)

atleast.one.endpoint(K= 2, delta = c(0.47, 0.48), Sigma = matrix(c(1, 0.5, 0.5, 1), nrow = 2),  
                     power = 0.8)

atleast.one.endpoint(K= 2, delta = c(0.47, 0.48), Sigma = matrix(c(1, 0.8, 0.8, 1), nrow = 2), 
                     power = 0.8)


