library(KERE)


### Name: cv.KERE
### Title: Cross-validation for KERE
### Aliases: cv.KERE
### Keywords: models regression

### ** Examples


N <- 200
X1 <- runif(N)
X2 <- 2*runif(N)
X3 <- 3*runif(N)
SNR <- 10 # signal-to-noise ratio
Y <- X1**1.5 + 2 * (X2**.5) + X1*X3
sigma <- sqrt(var(Y)/SNR)
Y <- Y + X2*rnorm(N,0,sigma)
X <- cbind(X1,X2,X3)

# set gaussian kernel 
kern <- rbfdot(sigma=0.1)

# define lambda sequence
lambda <- exp(seq(log(0.5),log(0.01),len=10))

cv.KERE(x=X, y=Y, kern, lambda = lambda, nfolds = 5, omega = 0.5)



