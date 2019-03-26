library(MLGL)


### Name: overlapgglasso
### Title: Group-lasso with overlapping groups
### Aliases: overlapgglasso

### ** Examples

# Least square loss
set.seed(42)
X <- simuBlockGaussian(50, 12, 5, 0.7)
y <- drop(X[, c(2, 7, 12)]%*%c(2, 2, -2) + rnorm(50, 0, 0.5))
var <- c(1:60, 1:8, 7:15)
group <- c(rep(1:12, each = 5), rep(13, 8), rep(14, 9))
res <- overlapgglasso(X, y, var, group)

# Logistic loss
y <- 2*(rowSums(X[,1:4])>0)-1
var <- c(1:60, 1:8, 7:15)
group <- c(rep(1:12, each = 5), rep(13, 8), rep(14, 9))
res <- overlapgglasso(X, y, var, group, loss = "logit")







