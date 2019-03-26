library(homals)


### Name: homals
### Title: Homogeneity Analysis
### Aliases: homals
### Keywords: models

### ** Examples

  data(galo)
  
  ##simple homals 2D-homals solution (School not active)
  res <- homals(galo, active = c(rep(TRUE, 4), FALSE))
  
  ##predict IQ 
  res <- homals(galo, active = c(rep(TRUE, 4), FALSE), sets = list(c(1,3,4),2,5))
  
  ##Single ranks for each variable (non-linear PCA)
  res <- homals(galo, active = c(rep(TRUE, 4), FALSE), sets = list(c(1,3,4),2,5))
  
  ##Nonlinear canonical correlation (2 sets of variables)
  res <- homals(galo, active = c(rep(TRUE, 4), FALSE), sets = list(c(1,2),c(3,4),5))
  
  ##regression (linear)
  data(neumann)
  res <- homals(neumann, sets = list(3, 1:2), level = "numerical", rank = 1)
  
  ##regression (monotone)
  res <- homals(neumann, sets = list(3, 1:2), level = "ordinal", rank = 1)
  
  ##3-dimensional senate solution
  data(senate)
  res <- homals(senate, active = c(FALSE, rep(TRUE, 20)), ndim = 3)
  
  ##Predicting Species in iris dataset (polynomial level constraints for predictors)
  data(iris)
  res <- homals(iris, sets = list(1:4,5), level = c(rep("polynomial",4),"nominal"), 
  rank = 2, itermax = 1000)




