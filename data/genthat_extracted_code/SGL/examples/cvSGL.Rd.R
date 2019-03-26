library(SGL)


### Name: cvSGL
### Title: Fit and Cross-Validate a GLM with a Combination of Lasso and
###   Group Lasso Regularization
### Aliases: cvSGL
### Keywords: model regression

### ** Examples

set.seed(1)
n = 50; p = 100; size.groups = 10
index <- ceiling(1:p / size.groups)
X = matrix(rnorm(n * p), ncol = p, nrow = n)
beta = (-2:2)
y = X[,1:5] %*% beta + 0.1*rnorm(n)
data = list(x = X, y = y)
cvFit = cvSGL(data, index, type = "linear")



