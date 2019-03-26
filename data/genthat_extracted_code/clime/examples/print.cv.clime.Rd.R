library(clime)


### Name: print.cv.clime
### Title: print a cross validated clime object
### Aliases: print.cv.clime
### Keywords: models multivariate

### ** Examples

## trivial example
n <- 50
p <- 5
X <- matrix(rnorm(n*p), nrow=n)
re.clime <- clime(X)
re.cv <- cv.clime(re.clime)
print(re.cv)



