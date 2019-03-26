library(brms)


### Name: bayes_R2.brmsfit
### Title: Compute a Bayesian version of R-squared for regression models
### Aliases: bayes_R2.brmsfit bayes_R2

### ** Examples

## Not run: 
##D fit <- brm(mpg ~ wt + cyl, data = mtcars)
##D summary(fit)
##D bayes_R2(fit)
##D 
##D # compute R2 with new data
##D nd <- data.frame(mpg = c(10, 20, 30), wt = c(4, 3, 2), cyl = c(8, 6, 4))
##D bayes_R2(fit, newdata = nd)
## End(Not run)




