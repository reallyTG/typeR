library(fungible)


### Name: fungible
### Title: Generate Fungible Regression Weights
### Aliases: fungible
### Keywords: fungible

### ** Examples


## Predictor correlation matrix
R.X <- matrix(c(1.00,   .56,  .77,
                 .56,  1.00,  .73,
                 .77,   .73, 1.00), 3, 3)
 
## vector of predictor-criterion correlations 
rxy <- c(.39, .34, .38)
 
 
## OLS standardized regression coefficients
b <- solve(R.X) %*% rxy
 
## Coefficient of determination (Rsq)
OLSRSQ <- t(b) %*% R.X %*% b

## theta controls the correlation between 
## yhatb: predicted criterion scores using OLS coefficients
## yhata: predicted criterion scores using alternate weights
theta <- .01

## desired correlation between yhata and yhatb 
r.yhata.yhatb <- sqrt( 1 - (theta)/OLSRSQ)

## number of returned sets of fungible weight vectors
Nsets <- 50

output <- fungible(R.X, rxy, r.yhata.yhatb, sets = Nsets, print = TRUE)



