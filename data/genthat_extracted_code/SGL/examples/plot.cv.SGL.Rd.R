library(SGL)


### Name: plot.cv.SGL
### Title: plots the cross-validated error curve produced by cv.SGL
### Aliases: plot.cv.SGL
### Keywords: models regression

### ** Examples

n = 50; p = 100; size.groups = 10
index <- ceiling(1:p / size.groups)
X = matrix(rnorm(n * p), ncol = p, nrow = n)
beta = (-2:2)
y = X[,1:5] %*% beta + 0.1*rnorm(n)
data = list(x = X, y = y)
cvFit = cvSGL(data, index, type = "linear")
plot(cvFit)



