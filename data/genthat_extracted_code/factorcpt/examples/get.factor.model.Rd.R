library(factorcpt)


### Name: get.factor.model
### Title: Factor model estimation via Principal Component Analysis
### Aliases: get.factor.model

### ** Examples

n <- 50; T <- 200
e <- matrix(rnorm(n*T), nrow=n) # idiosyncratic components
r <- 3 # factor number
Lam <- matrix(rnorm(n*r, 1, 1), nrow=n) # loadings
f <- matrix(rnorm(r*T), nrow=r) # factors
chi <- e*0 # common component
chp <- T/2 # change-point
chi <- Lam%*%f
x <- chi + sqrt(r)*e

gfm <- get.factor.model(x)
gfm$q.hat



