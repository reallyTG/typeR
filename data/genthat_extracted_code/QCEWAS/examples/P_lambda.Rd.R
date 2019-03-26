library(QCEWAS)


### Name: P_lambda
### Title: Calculation of the Lambda value
### Aliases: P_lambda

### ** Examples

  pvector <- ppoints(10000)
  P_lambda(pvector)
  # The lambda of a random distribution of p-values equals 1
  
  pvector[pvector > 0.9 & pvector < 0.91] <- NA
  P_lambda(pvector)
  # If low-significance results are removed (i.e. there are more
  # significant results than expected) lambda increases



