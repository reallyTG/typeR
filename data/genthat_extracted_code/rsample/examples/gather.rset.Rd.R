library(rsample)


### Name: gather.rset
### Title: Gather an 'rset' Object
### Aliases: gather.rset

### ** Examples

library(rsample)
cv_obj <- vfold_cv(mtcars, v = 10)
cv_obj$lm_rmse <- rnorm(10, mean = 2)
cv_obj$nnet_rmse <- rnorm(10, mean = 1)
gather(cv_obj)



