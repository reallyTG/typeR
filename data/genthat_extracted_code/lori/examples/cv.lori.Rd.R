library(lori)


### Name: cv.lori
### Title: selection of the regularization parameters (lambda1 and lambda2)
###   of the lori function by cross-validation
### Aliases: cv.lori

### ** Examples

X <- matrix(rnorm(20), 10)
Y <- matrix(rpois(10, 1:10), 5)
res <- cv.lori(Y, X, N=2, len=2)



