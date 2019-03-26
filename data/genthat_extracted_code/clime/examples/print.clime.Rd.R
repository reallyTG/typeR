library(clime)


### Name: print.clime
### Title: print a clime object
### Aliases: print.clime
### Keywords: models multivariate

### ** Examples

## trivial example
n <- 50
p <- 5
X <- matrix(rnorm(n*p), nrow=n)
re.clime <- clime(X)
print(re.clime)



