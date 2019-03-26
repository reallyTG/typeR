library(glamlasso)


### Name: glamlasso
### Title: Penalization in Large Scale Generalized Linear Array Models
### Aliases: glamlasso
### Keywords: package

### ** Examples

##size of example 
n1 <- 65; n2 <- 26; n3 <- 13; p1 <- 12; p2 <- 6; p3 <- 4

##marginal design matrices (tensor components)
X1 <- matrix(rnorm(n1 * p1), n1, p1) 
X2 <- matrix(rnorm(n2 * p2), n2, p2) 
X3 <- matrix(rnorm(n3 * p3), n3, p3) 
X <- list(X1, X2, X3)

##############gaussian example 
Beta <- array(rnorm(p1 * p2 * p3) * rbinom(p1 * p2 * p3, 1, 0.1), c(p1 , p2, p3))
Mu <- RH(X3, RH(X2, RH(X1, Beta)))
Y <- array(rnorm(n1 * n2 * n3, Mu), c(n1, n2, n3))

system.time(fit <- glamlasso(X, Y))

modelno <- length(fit$lambda)
plot(c(Beta), type = "h", ylim = range(Beta, fit$coef[, modelno]))
points(c(Beta))
lines(fit$coef[ , modelno], col = "red", type = "h")

## Not run: 
##D ###with non tensor design component Z
##D q <- 5
##D alpha <- matrix(rnorm(q)) * rbinom(q, 1, 0.5)
##D Z <- matrix(rnorm(n1 * n2 * n3 * q), n1 * n2 *n3, q) 
##D Y <- array(rnorm(n1 * n2 * n3, Mu + array(Z %*% alpha, c(n1, n2, n3))), c(n1, n2, n3))
##D system.time(fit <- glamlasso(X, Y, Z))
##D 
##D modelno <- length(fit$lambda)
##D par(mfrow = c(1, 2))
##D plot(c(Beta), type = "l", ylim = range(Beta, fit$coef[, modelno]))
##D points(c(Beta))
##D lines(fit$coef[ , modelno], col = "red")
##D plot(c(alpha), type = "h", ylim = range(Beta, fit$alpha[, modelno]))
##D points(c(alpha))
##D lines(fit$alpha[ , modelno], col = "red", type = "h")
##D 
##D ################ poisson example
##D Beta <- array(rnorm(p1 * p2 * p3, 0, 0.1) * rbinom(p1 * p2 * p3, 1, 0.1), c(p1 , p2, p3))
##D Mu <- RH(X3, RH(X2, RH(X1, Beta)))
##D Y <- array(rpois(n1 * n2 * n3, exp(Mu)), dim = c(n1, n2, n3))
##D system.time(fit <- glamlasso(X, Y, family = "poisson", nu = 0.1))
##D 
##D modelno <- length(fit$lambda)
##D plot(c(Beta), type = "h", ylim = range(Beta, fit$coef[, modelno]))
##D points(c(Beta))
##D lines(fit$coef[ , modelno], col = "red", type = "h")
##D 
## End(Not run)



