library(pcLasso)


### Name: predict.pcLasso
### Title: Make predictions from a "pcLasso" object
### Aliases: predict.pcLasso

### ** Examples

set.seed(1)
x <- matrix(rnorm(100 * 20), 100, 20)

# family = "gaussian"
y <- rnorm(100)
fit1 <- pcLasso(x, y, ratio = 0.8)
predict(fit1, xnew = x[1:5, ])

# family = "binomial"
y2 <- sample(0:1, 100, replace = TRUE)
fit2 <- pcLasso(x, y2, ratio = 0.8, family = "binomial")
predict(fit2, xnew = x[1:5, ])




