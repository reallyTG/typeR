library(brms)


### Name: loo_R2.brmsfit
### Title: Compute a LOO-adjusted R-squared for regression models
### Aliases: loo_R2.brmsfit loo_R2

### ** Examples

## Not run: 
##D fit <- brm(mpg ~ wt + cyl, data = mtcars)
##D summary(fit)
##D loo_R2(fit)
##D 
##D # compute R2 with new data
##D nd <- data.frame(mpg = c(10, 20, 30), wt = c(4, 3, 2), cyl = c(8, 6, 4))
##D loo_R2(fit, newdata = nd)
## End(Not run)




