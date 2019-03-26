library(blmeco)


### Name: loo.cv
### Title: Bayesian leave-one-out cross-validation
### Aliases: loo.cv
### Keywords: model

### ** Examples

## Not run: 
##D x <- runif(20)
##D y <- 2+0.5*x+rnorm(20, 0, 1)
##D mod <- lm(y~x)
##D loo.cv(mod, bias.corr=TRUE)  # increase nsim!!
##D   
## End(Not run)
  


