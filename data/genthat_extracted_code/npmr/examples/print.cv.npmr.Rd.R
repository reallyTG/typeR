library(npmr)


### Name: print.cv.npmr
### Title: summarize a "cv.npmr" object
### Aliases: print.cv.npmr

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
fold = sample(rep(1:10, length = nrow(X)))

# Simulate test data
Xtest = matrix(rnorm(m*p), m, p)
etatest = Xtest 
Ptest = exp(etatest)/rowSums(exp(etatest))
Ytest = t(apply(Ptest, 1, rmultinom, n = 1, size = 1))

# Fit NPMR for a sequence of lambda values without CV:
fit2 = cv.npmr(X, Y, lambda = exp(seq(7, -2)), foldid = fold)

# Print the NPMR fit:
fit2



