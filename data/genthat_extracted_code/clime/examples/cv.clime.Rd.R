library(clime)


### Name: cv.clime
### Title: k-fold cross validation for clime object
### Aliases: cv.clime
### Keywords: models multivariate

### ** Examples

## trivial example
n <- 50
p <- 5
X <- matrix(rnorm(n*p), nrow=n)
re.clime <- clime(X)
re.cv <- cv.clime(re.clime)
re.clime.opt <- clime(X, re.cv$lambdaopt)



