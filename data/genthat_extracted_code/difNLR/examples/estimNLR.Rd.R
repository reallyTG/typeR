library(difNLR)


### Name: estimNLR
### Title: Non-Linear Regression DIF models estimation.
### Aliases: estimNLR
### Keywords: DIF

### ** Examples

## Not run: 
##D data(GMAT)
##D 
##D # item 1
##D y  <- GMAT[, 1]
##D match  <- scale(apply(GMAT[, 1:20], 1, sum))
##D group <- GMAT[, "group"]
##D 
##D # formula for 3PL model with the same guessing
##D M <- formulaNLR(model = "3PLcg", type = "both")
##D 
##D # starting values for 3PL model with the same guessing for item 1
##D start <- startNLR(GMAT[, 1:20], group, model = "3PLcg", parameterization = "classic")
##D start <- start[[1]][M$M0$parameters]
##D 
##D # Non-linear least squares
##D fitNLSM0 <- estimNLR(y = y, match = match, group = group,
##D                      formula = M$M0$formula, method = "nls",
##D                      lower = M$M0$lower, upper = M$M0$upper, start = start)
##D fitNLSM0
##D 
##D coef(fitNLSM0)
##D logLik(fitNLSM0)
##D vcov(fitNLSM0)
##D fitted(fitNLSM0)
##D residuals(fitNLSM0)
##D 
##D # Maximum likelihood
##D fitLKLM0 <- estimNLR(y = y, match = match, group = group,
##D                      formula = M$M0$formula, method = "likelihood",
##D                      lower = M$M0$lower, upper = M$M0$upper, start = start)
##D fitLKLM0
##D 
##D coef(fitLKLM0)
##D logLik(fitLKLM0)
##D vcov(fitLKLM0)
##D fitted(fitLKLM0)
##D residuals(fitLKLM0)
##D 
## End(Not run)




