library(frmqa)


### Name: besselK_inc_err
### Title: Calculation of the Incomplete BesselK Functions in Terms of the
###   Complementary Error Functions
### Aliases: besselK_inc_err

### ** Examples

  ## Accuracy tests
  x <- 2
  z <- 5
  lambda <- -c(1/2, 3/2)
  lower <- sapply(lambda, function(w.)
    besselK_inc_err(x, z, lambda = w., 200, lower = TRUE))
  upper <- sapply(lambda, function(w.)
    besselK_inc_err(x, z, lambda = w., 200, lower = FALSE)) 
  ## sum of two parts   
  (lower + upper)
  ## equals the whole function
  (besselK(z, nu = lambda))
  



