library(customizedTraining)


### Name: predict.customizedGlmnet
### Title: make predictions from a 'customizedGlmnet' object
### Aliases: predict.customizedGlmnet
### Keywords: ~kwd1 ~kwd2

### ** Examples

require(glmnet)

# Simulate synthetic data

n = m = 150
p = 50
q = 5
K = 3
sigmaC = 10
sigmaX = sigmaY = 1
set.seed(5914)

beta = matrix(0, nrow = p, ncol = K)
for (k in 1:K) beta[sample(1:p, q), k] = 1
c = matrix(rnorm(K*p, 0, sigmaC), K, p)
eta = rnorm(K)
pi = (exp(eta)+1)/sum(exp(eta)+1)
z = t(rmultinom(m + n, 1, pi))
x = crossprod(t(z), c) + matrix(rnorm((m + n)*p, 0, sigmaX), m + n, p)
y = rowSums(z*(crossprod(t(x), beta))) + rnorm(m + n, 0, sigmaY)

x.train = x[1:n, ]
y.train = y[1:n]
x.test = x[n + 1:m, ]
y.test = y[n + 1:m]


# Example 1: Use clustering to fit the customized training model to training
# and test data with no predefined test-set blocks

fit1 = customizedGlmnet(x.train, y.train, x.test, G = 3,
    family = "gaussian")

# Compute test error using the predict function:
mean((y.test - predict(fit1, lambda = 10))^2)


# Example 2: If the test set has predefined blocks, use these blocks to define
# the customized training sets, instead of using clustering.
group.id = apply(z == 1, 1, which)[n + 1:m]

fit2 = customizedGlmnet(x.train, y.train, x.test, group.id)

# Compute test error using the predict function:
mean((y.test - predict(fit2, lambda = 10))^2)



