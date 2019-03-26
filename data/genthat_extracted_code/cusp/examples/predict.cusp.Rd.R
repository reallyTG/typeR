library(cusp)


### Name: predict.cusp
### Title: Predict method for Cusp Model Fits
### Aliases: predict.cusp
### Keywords: ~kwd1 ~kwd2

### ** Examples

set.seed(123)
# example with regressors
x1 = runif(150)
x2 = runif(150)
z = Vectorize(rcusp)(1, 4*x1-2, 4*x2-1)
data <- data.frame(x1, x2, z)
fit <- cusp(y ~ z, alpha ~ x1+x2, beta ~ x1+x2, data)

newdata = data.frame(x1 = runif(10), x2 = runif(10), z = 0)
predict(fit, newdata)



