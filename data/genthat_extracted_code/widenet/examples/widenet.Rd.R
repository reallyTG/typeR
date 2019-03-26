library(widenet)


### Name: widenet
### Title: Extends the relaxnet Package with Polynomial Basis Expansions
### Aliases: widenet

### ** Examples


n <- 300
p <- 5

set.seed(23)
x <- matrix(rnorm(n*p), n, p)

colnames(x) <- paste("x", 1:ncol(x), sep = "")

y <- x[, 1] + x[, 2] + x[, 3] * x[, 4] + x[, 5]^2 + rnorm(n)

widenet.result <- widenet(x, y, family = "gaussian",
                          order = 2, alpha = 0.5)

summary(widenet.result)
coefs <- drop(predict(widenet.result, type = "coef"))
coefs[coefs != 0]



