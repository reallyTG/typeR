library(detect)


### Name: databu
### Title: Simulated example for abundance model
### Aliases: databu
### Keywords: datasets

### ** Examples

data(databu)
str(databu)
## Not run: 
##D ## simulation
##D n <- 1000
##D set.seed(1234)
##D x1 <- runif(n,0,1)
##D x2 <- rnorm(n,0,1)
##D x3 <- runif(n,-1,1)
##D x4 <- runif(n,-1,1)
##D x5 <- rbinom(n,1,0.6)
##D x6 <- rbinom(n,1,0.4)
##D x7 <- rnorm(n,0,1)
##D X <- model.matrix(~ x1 + x5)
##D Z <- model.matrix(~ x2 + x5)
##D Q <- model.matrix(~ x7)
##D beta <- c(2,-0.8,0.5)
##D theta <- c(1, 2, -0.5)
##D phi <- 0.3
##D p <- drop(binomial("logit")$linkinv(Z %*% theta))
##D lambda <- drop(exp(X %*% beta))
##D A <- rbinom(n, 1, 1-phi)
##D N <- rpois(n, lambda * A)
##D Y <- rbinom(n, N, p)
##D databu <- data.frame(N=N, Y=Y, x1, x2, x3, x4, x5, x6, p=p, lambda=lambda, A, phi)
## End(Not run)



