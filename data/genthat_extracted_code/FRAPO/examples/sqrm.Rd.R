library(FRAPO)


### Name: sqrm
### Title: Square root of a quadratic matrix
### Aliases: sqrm
### Keywords: array algebra

### ** Examples

data(StockIndex)
S <- cov(StockIndex)
SR <- sqrm(S)
all.equal(crossprod(SR), S)



