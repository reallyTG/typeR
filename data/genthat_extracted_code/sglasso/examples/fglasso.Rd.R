library(sglasso)


### Name: fglasso
### Title: L1-penalized Factorial Graphical Lasso Model
### Aliases: fglasso
### Keywords: models graph multivariate

### ** Examples

#######################
# fglasso solution path
#######################
N <- 50
tp <- 3
p <- 3
X <- matrix(rnorm(N * p * tp), N, tp * p)
S <- crossprod(X) / N
model <- list(lag0 = c(s = "c", n = "ut"), lag1 = c(s = "t", n = "."))
out.fglasso <- fglasso(S = S, model = model, tp = tp, p = p)
out.fglasso



