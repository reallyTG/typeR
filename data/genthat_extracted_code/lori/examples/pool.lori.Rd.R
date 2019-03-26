library(lori)


### Name: pool.lori
### Title: aggregate lori multiple imputation results
### Aliases: pool.lori

### ** Examples

X <- matrix(rnorm(50), 25)
Y <- matrix(rpois(25, 1:25), 5)
res <- mi.lori(Y, X, 10, 10, 2)
poolres <- pool.lori(res)



