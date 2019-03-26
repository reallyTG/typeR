library(mokken)


### Name: twoway
### Title: Two-way imputation
### Aliases: twoway
### Keywords: twoway

### ** Examples

  data(DS14)

  # Handle missing data and recode negatively worded items
  X <- DS14[, 3 : 16]
  X <- twoway(X)
  X <- recode(X, c(1, 3))
  head(X)



