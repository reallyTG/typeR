library(MESS)


### Name: adaptive.weights
### Title: Compute weights for use with adaptive lasso.
### Aliases: adaptive.weights
### Keywords: manip

### ** Examples


set.seed(1)
x <- matrix(rnorm(50000), nrow=50)
y <- rnorm(50, mean=x[,1])
weights <- adaptive.weights(x, y)

if (requireNamespace("glmnet", quietly = TRUE)) {
    res <- glmnet::glmnet(x, y, penalty.factor=weights$weights)
    head(res)
}




