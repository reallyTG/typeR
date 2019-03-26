library(textTinyR)


### Name: select_predictors
### Title: Exclude highly correlated predictors
### Aliases: select_predictors

### ** Examples


library(textTinyR)

set.seed(1)
resp = runif(100)

set.seed(2)
col = runif(100)

matr = matrix(c(col, col^4, col^6, col^8, col^10), nrow = 100, ncol = 5)

out = select_predictors(resp, matr, predictors_upper_thresh = 0.75)



