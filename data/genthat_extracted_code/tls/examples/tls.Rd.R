library(tls)


### Name: tls
### Title: Fitting error-in-variables models via total least squares.
### Aliases: tls

### ** Examples

library(tls)
set.seed(100)
X.1 <- sqrt(1:100)
X.tilde.1 <- rnorm(100) + X.1
X.2 <- sample(X.1, size = length(X.1), replace = FALSE)
X.tilde.2 <- rnorm(100) + X.2
Y <- rnorm(100) + X.1 + X.2
data <- data.frame(Y = Y, X.1 = X.tilde.1, X.2 = X.tilde.2)
tls(Y ~ X.1 + X.2 - 1, data = data)



