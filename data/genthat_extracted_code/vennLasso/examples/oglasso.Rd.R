library(vennLasso)


### Name: oglasso
### Title: Overlapping Group Lasso (OGLasso)
### Aliases: oglasso

### ** Examples

library(vennLasso)

set.seed(123)
n.obs <- 1e3
n.vars <- 50

true.beta <- c(rep(0,2), 1, -1, rep(0, 8), 0.5, -0.5, 1, rep(0, 35))

x <- matrix(rnorm(n.obs * n.vars), n.obs, n.vars)
y <- rnorm(n.obs, sd = 3) + drop(x %*% true.beta)

groups <- c(list(c(1,2), c(2,3), c(3,4,5), 5:10, 6:12, 7:15), lapply(16:50, function(x) x))

## Not run: 
##D fit <- oglasso(x = x, y = y, group = groups)
## End(Not run)



