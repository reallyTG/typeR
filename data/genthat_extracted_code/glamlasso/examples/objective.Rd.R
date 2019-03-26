library(glamlasso)


### Name: objective
### Title: Compute objective values
### Aliases: objective glamlasso_objective

### ** Examples

## Not run: 
##D n1 <- 65; n2 <- 26; n3 <- 13; p1 <- 13; p2 <- 5; p3 <- 4
##D X1 <- matrix(rnorm(n1 * p1), n1, p1) 
##D X2 <- matrix(rnorm(n2 * p2), n2, p2) 
##D X3 <- matrix(rnorm(n3 * p3), n3, p3) 
##D Beta <- array(rnorm(p1 * p2 * p3) * rbinom(p1 * p2 * p3, 1, 0.1), c(p1 , p2, p3))
##D mu <- RH(X3, RH(X2, RH(X1, Beta)))
##D Y <- array(rnorm(n1 * n2 * n3, mu), dim = c(n1, n2, n3))
##D fit <- glamlasso(list(X1, X2, X3), Y, family = "gaussian", penalty = "lasso", iwls = "exact")
##D objfit <- objective(Y, NULL, list(X1, X2, X3), fit$coef, fit$lambda, NULL, fit$family)
##D plot(objfit, type = "l")
## End(Not run)



