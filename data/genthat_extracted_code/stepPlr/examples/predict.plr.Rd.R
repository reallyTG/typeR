library(stepPlr)


### Name: predict.plr
### Title: prediction function for plr
### Aliases: predict.plr
### Keywords: models regression

### ** Examples

n <- 100

p <- 10
x0 <- matrix(rnorm(n * p), nrow=n)
y <- sample(c(0, 1), n, replace=TRUE)
fit <- plr(x0, y, lambda=1)
x1 <- matrix(rnorm(n * p), nrow=n)
pred1 <- predict(fit, x1, type="link")
pred2 <- predict(fit, x1, type="response")
pred3 <- predict(fit, x1, type="class")

p <- 3
z <- matrix(sample(seq(3), n * p, replace=TRUE), nrow=n)
x0 <- data.frame(x1=factor(z[, 1]), x2=factor(z[, 2]), x3=factor(z[, 3]))
y <- sample(c(0, 1), n, replace=TRUE)
fit <- plr(x0, y, lambda=1)
z <- matrix(sample(seq(3), n * p, replace=TRUE), nrow=n)
x1 <- data.frame(x1=factor(z[, 1]), x2=factor(z[, 2]), x3=factor(z[, 3]))
pred1 <- predict(fit, x1, type="link")
pred2 <- predict(fit, x1, type="response")
pred3 <- predict(fit, x1, type="class")



