library(lg)


### Name: clg
### Title: The locally Gaussian conditional density estimator
### Aliases: clg

### ** Examples

  # A 3 variate example
  x <- cbind(rnorm(100), rnorm(100), rnorm(100))

  # Generate the lg-object with default settings
  lg_object <- lg_main(x)

  # Estimate the conditional density of X1|X2 = 0, X3 = 1 on a small grid
  cond_dens <- clg(lg_object, grid = matrix(-4:4, ncol = 1), condition = c(0, 1))




