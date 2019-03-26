library(glamlasso)


### Name: glamlassoRR
### Title: Penalized reduced rank regression in a GLAM
### Aliases: glamlassoRR

### ** Examples

## Not run: 
##D ##size of example 
##D n1 <- 65; n2 <- 26; n3 <- 13; p1 <- 12; p2 <- 6; p3 <- 4
##D 
##D ##marginal design matrices (tensor components)
##D X1 <- matrix(rnorm(n1 * p1), n1, p1) 
##D X2 <- matrix(rnorm(n2 * p2), n2, p2) 
##D X3 <- matrix(rnorm(n3 * p3), n3, p3) 
##D X <- list(X1, X2, X3)
##D Beta12 <- matrix(rnorm(p1 * p2), p1, p2) * matrix(rbinom(p1 * p2, 1, 0.5), p1, p2)
##D Beta3 <- matrix(rnorm(p3) * rbinom(p3, 1, 0.5), p3, 1)
##D Beta <- outer(Beta12, c(Beta3))
##D Mu <- RH(X3, RH(X2, RH(X1, Beta)))
##D Y <- array(rnorm(n, Mu), dim = c(n1, n2, n3))  
##D 
##D system.time(fit <- glamlassoRR(X, Y))
##D 
##D modelno  <- length(fit$lambda)
##D par(mfrow = c(1, 3))
##D plot(c(Beta), type = "h")
##D points(c(Beta))
##D lines(c(outer(fit$coef12[, modelno], c(fit$coef3[, modelno]))), col = "red", type = "h")
##D plot(c(Beta12), ylim = range(Beta12, fit$coef12[, modelno]), type = "h")
##D points(c(Beta12))
##D lines(fit$coef12[, modelno], col = "red", type = "h")
##D plot(c(Beta3), ylim = range(Beta3, fit$coef3[, modelno]), type = "h")
##D points(c(Beta3))
##D lines(fit$coef3[, modelno], col = "red", type = "h")
##D 
##D ###with non tensor design component Z
##D q <- 5
##D alpha <- matrix(rnorm(q)) * rbinom(q, 1, 0.5)
##D Z <- matrix(rnorm(n1 * n2 * n3 * q), n1 * n2 * n3, q) 
##D Y <- array(rnorm(n1 * n2 * n3, Mu + array(Z %*% alpha, c(n1, n2, n3))), c(n1, n2, n3))
##D system.time(fit <- glamlassoRR(X, Y, Z))
##D 
##D modelno <- length(fit$lambda)
##D par(mfrow = c(2, 2))
##D plot(c(Beta), type = "h")
##D points(c(Beta))
##D lines(c(outer(fit$coef12[, modelno], c(fit$coef3[, modelno]))), col = "red", type = "h")
##D plot(c(Beta12), ylim = range(Beta12,fit$coef12[, modelno]), type = "h")
##D points(c(Beta12))
##D lines(fit$coef12[, modelno], col = "red", type = "h")
##D plot(c(Beta3), ylim = range(Beta3, fit$coef3[, modelno]), type = "h")
##D points(c(Beta3))
##D lines(fit$coef3[, modelno], col = "red", type = "h")
##D plot(c(alpha), ylim = range(alpha, fit$alpha[, modelno]), type = "h")
##D points(c(alpha))
##D lines(fit$alpha[, modelno], col = "red", type = "h")
##D 
##D ################ poisson example
##D Beta12 <- matrix(rnorm(p1 * p2, 0, 0.5), p1, p2) * matrix(rbinom(p1 * p2, 1, 0.1), p1, p2)
##D Beta3 <-  matrix(rnorm(p3, 0, 0.5) * rbinom(p3, 1, 0.5), p3, 1)
##D Beta <- outer(Beta12, c(Beta3))
##D Mu <- RH(X3, RH(X2, RH(X1, Beta)))
##D Y <- array(rpois(n1 * n2 * n3, exp(Mu)), dim = c(n1, n2, n3))
##D system.time(fit <- glamlassoRR(X, Y, family = "poisson"))
##D 
##D modelno <- length(fit$lambda)
##D par(mfrow = c(1, 3))
##D plot(c(Beta), type = "h")
##D points(c(Beta))
##D lines(c(outer(fit$coef12[, modelno], c(fit$coef3[, modelno]))), col = "red", type = "h")
##D plot(c(Beta12), ylim = range(Beta12, fit$coef12[, modelno]), type = "h")
##D points(c(Beta12))
##D lines(fit$coef12[, modelno], col = "red", type = "h")
##D plot(c(Beta3), ylim = range(Beta3, fit$coef3[, modelno]), type = "h")
##D points(c(Beta3))
##D lines(fit$coef3[, modelno], col = "red", type = "h")
##D 
## End(Not run)



