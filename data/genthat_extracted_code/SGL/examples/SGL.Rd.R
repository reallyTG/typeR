library(SGL)


### Name: SGL
### Title: Fit a GLM with a Combination of Lasso and Group Lasso
###   Regularization
### Aliases: SGL
### Keywords: model regression

### ** Examples

n = 50; p = 100; size.groups = 10
index <- ceiling(1:p / size.groups)
X = matrix(rnorm(n * p), ncol = p, nrow = n)
beta = (-2:2)
y = X[,1:5] %*% beta + 0.1*rnorm(n)
data = list(x = X, y = y)
fit = SGL(data, index, type = "linear")



