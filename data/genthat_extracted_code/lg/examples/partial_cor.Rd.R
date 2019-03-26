library(lg)


### Name: partial_cor
### Title: Calculate the local Gaussian partial correlation
### Aliases: partial_cor

### ** Examples

  # A 3 variate example
  x <- cbind(rnorm(100), rnorm(100), rnorm(100))

  # Generate the lg-object with default settings
  lg_object <- lg_main(x)

  # Estimate the local partial Gaussian correlation between X1 and X2 given X3 = 1 on
  # a small grid
  partial_correlations <- partial_cor(lg_object,
                                     grid = cbind(-4:4, -4:4),
                                     condition = 1)




