library(mokken)


### Name: check.ca
### Title: Check conditional association to indentify local dependence.
### Aliases: check.ca
### Keywords: check.ca

### ** Examples

  data(DS14)

  # Handle missing data and recode negatively worded items
  X <- DS14[, 3 : 16]
  X <- twoway(X)
  X <- recode(X, c(1, 3))
  
  # Negative affectivity
  Na <- X[, c(1, 3, 6, 8, 10, 11, 14)] 
  
  # Social inhibition
  Si <- X[, c(2, 4, 5, 7, 9, 12, 13)] 
  
  check.ca(Na, TRUE)



