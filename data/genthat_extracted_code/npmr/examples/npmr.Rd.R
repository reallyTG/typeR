library(npmr)


### Name: npmr
### Title: Nuclear penalized multinomial regression
### Aliases: npmr

### ** Examples

#   Fit NPMR to simulated data

K = 5
n = 1000
m = 10000
p = 10
r = 2

# Simulated training data
set.seed(8369)
A = matrix(rnorm(p*r), p, r)
C = matrix(rnorm(K*r), K, r)
B = tcrossprod(A, C)            # low-rank coefficient matrix
X = matrix(rnorm(n*p), n, p)    # covariate matrix with iid Gaussian entries
eta = X 
P = exp(eta)/rowSums(exp(eta))
Y = t(apply(P, 1, rmultinom, n = 1, size = 1))

# Simulate test data
Xtest = matrix(rnorm(m*p), m, p)
etatest = Xtest 
Ptest = exp(etatest)/rowSums(exp(etatest))
Ytest = t(apply(Ptest, 1, rmultinom, n = 1, size = 1))

# Fit NPMR for a sequence of lambda values without CV:
fit2 = npmr(X, Y, lambda = exp(seq(7, -2)))

# Print the NPMR fit:
fit2

# Produce a biplot:
plot(fit2, lambda = 20)

# Compute mean test error using the predict function (for each value of lambda):
getloss = function(pred, Y) {
    -mean(log(rowSums(Y*pred)))
}
apply(predict(fit2, Xtest), 3, getloss, Ytest)



