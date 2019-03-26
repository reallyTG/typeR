library("freqdom")

n = 10000
X = matrix(rnorm(2*n),n,2)
Y = X[2:n,]
X = X[1:(n-1),]

covs = cov.structure(X,Y,lags = 1)
if (norm(covs$operators[,,1] - diag(2)) > 0.1)
  stop("Lag 1 should be diag!")
t(covs)
