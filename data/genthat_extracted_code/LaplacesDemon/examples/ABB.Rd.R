library(LaplacesDemon)


### Name: ABB
### Title: Approximate Bayesian Bootstrap
### Aliases: ABB
### Keywords: Imputation

### ** Examples

library(LaplacesDemon)

### Create Data
J <- 10 #Number of variables
m <- 20 #Number of missings
N <- 50 #Number of records
mu <- runif(J, 0, 100)
sigma <- runif(J, 0, 100)
X <- matrix(0, N, J)
for (j in 1:J) X[,j] <- rnorm(N, mu[j], sigma[j])

### Create Missing Values
M1 <- rep(0, N*J)
M2 <- sample(N*J, m)
M1[M2] <- 1
M <- matrix(M1, N, J)
X <- ifelse(M == 1, NA, X)

### Approximate Bayesian Bootstrap
imp <- ABB(X, K=1)

### Replace Missing Values in X (when K=1)
X.imp <- X
X.imp[which(is.na(X.imp))] <- unlist(imp)
X.imp



