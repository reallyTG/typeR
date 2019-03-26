library(MWRidge)


### Name: MWRidge
### Title: Two Stage Moving-Window Ridge Method for Prediction and
###   Estimation
### Aliases: MWRidge predict
### Keywords: model fitting

### ** Examples

n = 100
p = 200
set.seed(1)
X = matrix(rnorm(n * p, mean = 0, sd = 1), nrow = n, ncol = p)
beta = runif(p)
err = rnorm(n)
Y = X %*% beta + err
beta.hat = MWRidge(X, Y, lambda = 1, eta = 2, phi = 1, d = 2, method = 'linear')

prob = exp(X %*% beta)/(1 + exp(X %*% beta))
Y = rbinom(n, 1, as.vector(prob))
beta.hat = MWRidge(X, Y, lambda = 0.1, eta = 0.2, phi = 1, d = 2, method = 'logistic')

X.test = matrix(rnorm(50 * p, mean = 0, sd = 1), nrow = 50, ncol = p)
Y.hat = predict(X.test, X, Y, lambda = 0.1, eta = 0.2, phi = 1, d = 2, method = 'logistic')



