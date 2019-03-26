library(flexmix)


### Name: FLXMRglmnet
### Title: FlexMix Interface for Adaptive Lasso / Elastic Net with GLMs
### Aliases: FLXMRglmnet FLXMRglmnet-class
### Keywords: regression cluster

### ** Examples

    set.seed(12)
    p <- 10
    beta <- matrix(0, nrow = p + 1, ncol = 2)
    beta[1,] <- c(-1, 1)
    beta[cbind(c(5, 10), c(1, 2))] <- 1

    nobs <- 100
    X <- matrix(rnorm(nobs * p), nobs, p)
    mu <- cbind(1, X) %*% beta
    z <- sample(1:ncol(beta), nobs, replace = TRUE)
    y <- mu[cbind(1:nobs, z)] + rnorm(nobs)
    data <- data.frame(y, X)
    ## The maximum number of iterations is reduced to
    ## avoid a long running time.
    fo <- sample(rep(seq(10), length = nrow(data)))
    ex1 <- flexmix(y ~ ., data = data, k = 2, cluster = z,
                   model = FLXMRglmnet(foldid = fo),
                   control = list(iter.max = 2))
    parameters(ex1)



