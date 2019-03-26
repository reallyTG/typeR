library(multiviewtest)


### Name: optimize_over_Pi
### Title: Exponentiated gradient descent for estimating Pi
### Aliases: optimize_over_Pi

### ** Examples

# Generate two-view Gaussian mixture model data with Pi = I/3
set.seed(1)
n <- 100
sig <- 0.5
p <- 2
K <- 3
mu1 <- cbind(c(2, 0), c(0, 2),  c(2, -2), c(-2, 0), c(0, -2), c(-2, 2))
mu2 <- cbind(c(-2, 0), c(0, -2), c(-2, 2), c(2, 0), c(0, 2), c(2, -2))
cl <- sample(1:K, n, replace=TRUE)
x <- list(matrix(sig* rnorm(n*p), n, p) + t(mu1)[cl, ],
matrix(sig * rnorm(n*p), n, p) + t(mu2)[cl, ])

# Cluster each view
library(mclust)
EM.View1 <- Mclust(x[[1]], G=3, modelNames=c("EII"))
EM.View2 <- Mclust(x[[2]], G=3, modelNames=c("EII"))

# Constructs inputs to algorithm
logphi1 <-  cdens("EII", x[[1]], logarithm=TRUE, EM.View1$parameters)
logphi2 <-  cdens("EII", x[[2]], logarithm=TRUE, EM.View2$parameters)
pi1.est <- EM.View1$parameters$pro
pi2.est <- EM.View2$parameters$pro

# Estimates Pi
Pi.est <- optimize_over_Pi(logphi1, logphi2, pi1.est, pi2.est)
Pi.est$Pi




