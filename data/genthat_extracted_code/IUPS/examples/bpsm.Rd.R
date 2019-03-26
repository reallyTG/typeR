library(IUPS)


### Name: bpsm
### Title: Bayesian Propensity Score Matching
### Aliases: bpsm

### ** Examples

library(boot)

a = 2; b = c(1, -2, 5); N = 500
x1 <- runif(N, 0, 1)
x2 <- runif(N, 0, 1)
X <- as.matrix(cbind(rep(1, N), x1, x2))
p <- inv.logit( X %*% b )
t <- rbinom(N, 1, p)
e <- rnorm(N, 0, 1)
Y <- 5 * t + a * ( x1 + x2 ) + e
bpsm( Y, t, X, method = "AI", estimand = "ATE" )



