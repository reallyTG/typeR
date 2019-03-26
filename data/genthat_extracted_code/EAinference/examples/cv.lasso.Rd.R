library(EAinference)


### Name: cv.lasso
### Title: Compute K-fold cross-validated mean squared error for lasso
### Aliases: cv.lasso

### ** Examples

set.seed(123)
n <- 30
p <- 50
group <- rep(1:(p/10),each=10)
weights <- rep(1, max(group))
X <- matrix(rnorm(n*p),n)
truebeta <- c(rep(1,5),rep(0,p-5))
Y <- X%*%truebeta + rnorm(n)

# To accelerate the computational time, we set K=2 and num.lbdseq=2.
# However, in practice, Allowing K=10 and num.lbdseq > 100 is recommended.
cv.lasso(X = X, Y = Y, group = group, weights = weights, K = 2,
type = "grlasso", num.lbdseq = 2, plot.it = FALSE)
cv.lasso(X = X, Y = Y, group = group, weights = weights, K = 2,
type = "sgrlasso", num.lbdseq = 2, plot.it = FALSE)



