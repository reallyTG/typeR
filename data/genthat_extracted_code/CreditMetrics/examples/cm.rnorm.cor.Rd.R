library(CreditMetrics)


### Name: cm.rnorm.cor
### Title: Computation of correlated standard normal distributed random
###   numbers
### Aliases: cm.rnorm.cor
### Keywords: models

### ** Examples

  N <- 3
  n <- 50000
  firmnames <- c("firm 1", "firm 2", "firm 3")
  
  # correlation matrix
  rho <- matrix(c(  1, 0.4, 0.6,
                  0.4,   1, 0.5,
                  0.6, 0.5,   1), 3, 3, dimnames = list(firmnames, firmnames),
                  byrow = TRUE)
  
  cm.rnorm.cor(N, n, rho)



