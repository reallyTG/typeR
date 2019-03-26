library(SGL)


### Name: predictSGL
### Title: Outputs Predicted Responses from an SGL Model for New
###   Observations
### Aliases: predictSGL
### Keywords: models regression

### ** Examples

n = 50; p = 100; size.groups = 10
index <- ceiling(1:p / size.groups)
X = matrix(rnorm(n * p), ncol = p, nrow = n)
beta = (-2:2)
y = X[,1:5] %*% beta + 0.1*rnorm(n)
data = list(x = X, y = y)
Fit = SGL(data, index, type = "linear")
X.new = matrix(rnorm(n * p), ncol = p, nrow = n)
predictSGL(Fit, X.new, 5)



