library(frmqa)


### Name: gamma_inc_err
### Title: Accurate Calculation of the Incomplete Gamma Functions Using
###   Analytical Formulae
### Aliases: gamma_inc_err

### ** Examples

  ## Accuracy tests
  x <- 3
  lambda <- 3/2
  lower <- sapply(lambda, function(w.)
    gamma_inc_err(x, lambda = w., 200, lower = TRUE))
  upper <- sapply(lambda, function(w.)
    gamma_inc_err(x, lambda = w., 200, lower = FALSE))  
 ## sum of two parts   
  (lower + upper)
 ## equals the whole function 
  (gamma(lambda))
  



