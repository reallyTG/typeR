library(pcLasso)


### Name: pcLasso
### Title: Fit a model with principal components lasso
### Aliases: pcLasso

### ** Examples

set.seed(1)
x <- matrix(rnorm(100 * 20), 100, 20)
y <- rnorm(100)

# all features in one group by default
fit1 <- pcLasso(x, y, ratio = 0.8)
# print(fit1)  # Not run
# features in groups
groups <- vector("list", 4)
for (k in 1:4) {
    groups[[k]] <- 5 * (k-1) + 1:5
}
fit2 <- pcLasso(x, y, groups = groups, ratio = 0.8)
# groups can be overlapping
groups[[1]] <- 1:8
fit3 <- pcLasso(x, y, groups = groups, ratio = 0.8)

# specify ratio or theta, but not both
fit4 <- pcLasso(x, y, groups = groups, theta = 10)

# family = "binomial"
y2 <- sample(0:1, 100, replace = TRUE)
fit5 <- pcLasso(x, y2, ratio = 0.8, family = "binomial")

# example where SVD is computed once,  then re-used
fit1 <- pcLasso(x, y, ratio = 0.8)
fit2 <- pcLasso(x, y, ratio = 0.8, SVD_info = fit1$SVD_info)




