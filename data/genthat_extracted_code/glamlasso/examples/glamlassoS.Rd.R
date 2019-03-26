library(glamlasso)


### Name: glamlassoS
### Title: Penalization in Large Scale Generalized Linear Array Models
### Aliases: glamlassoS
### Keywords: package

### ** Examples

## Not run: 
##D 
##D ##size of example
##D n1 <- 65; n2 <- 26; n3 <- 13; p1 <- 13; p2 <- 5; 
##D 
##D ##marginal design matrices (tensor components)
##D X1 <- matrix(rnorm(n1 * p1), n1, p1)
##D X2 <- matrix(rnorm(n2 * p2), n2, p2)
##D X <- list(X1, X2)
##D V <- array(rnorm(n3 * n2 * n1), c(n1, n2, n3))
##D 
##D ##gaussian example
##D Beta <- array(rnorm(p1 * p2) * rbinom(p1 * p2, 1, 0.1), c(p1 , p2))
##D Mu <- V * array(RH(X2, RH(X1, Beta)), c(n1, n2, n3))
##D Y <- array(rnorm(n1 * n2 * n3, Mu), c(n1, n2, n3))
##D system.time(fit <- glamlassoS(X, Y, V))
##D 
##D modelno <- length(fit$lambda)
##D plot(c(Beta), ylim = range(Beta, fit$coef[, modelno]), type = "h")
##D points(c(Beta))
##D lines(c(fit$coef[, modelno]), col = "red", type = "h")
##D 
##D ###with non tensor design component Z
##D q <- 5
##D alpha <- matrix(rnorm(q)) * rbinom(q, 1, 0.5)
##D Z <- matrix(rnorm(n1 * n2 * n3 * q), n1 * n2 *n3, q) 
##D Y <- array(rnorm(n1 * n2 * n3, Mu + array(Z %*% alpha, c(n1, n2, n3))), c(n1, n2, n3))
##D system.time(fit <- glamlassoS(X, Y, V , Z))
##D 
##D modelno <- length(fit$lambda)
##D par(mfrow = c(1, 2))
##D plot(c(Beta), type="h", ylim = range(Beta, fit$coef[, modelno]))
##D points(c(Beta))
##D lines(fit$coef[ , modelno], col = "red", type = "h")
##D plot(c(alpha), type = "h", ylim = range(alpha, fit$alpha[, modelno]))
##D points(c(alpha))
##D lines(fit$alpha[ , modelno], col = "red", type = "h")
##D 
##D ################ poisson example
##D Beta <- matrix(rnorm(p1 * p2, 0, 0.1) * rbinom(p1 * p2, 1, 0.1), p1 , p2)
##D Mu <- V * array(RH(X2, RH(X1, Beta)), c(n1, n2, n3))
##D Y <- array(rpois(n1 * n2 * n3, exp(Mu)), dim = c(n1, n2, n3))
##D system.time(fit <- glamlassoS(X, Y, V, family = "poisson", nu = 0.1))
##D 
##D modelno <- length(fit$lambda)
##D plot(c(Beta), type = "h", ylim = range(Beta, fit$coef[, modelno]))
##D points(c(Beta))
##D lines(fit$coef[ , modelno], col = "red", type = "h")
##D 
## End(Not run)



