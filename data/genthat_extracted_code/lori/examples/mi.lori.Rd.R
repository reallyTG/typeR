library(lori)


### Name: mi.lori
### Title: multiple imputation of count data using the lori model
### Aliases: mi.lori

### ** Examples

X <- matrix(rnorm(50), 25)
Y <- matrix(rpois(25, 1:25), 5)
res <- mi.lori(Y, X, 10, 10, 2)



