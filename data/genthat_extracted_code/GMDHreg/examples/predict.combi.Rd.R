library(GMDHreg)


### Name: predict.combi
### Title: Predict GMDH Combinatorial
### Aliases: predict.combi

### ** Examples

set.seed(123)
x <- matrix(data = c(rnorm(1050)), ncol = 3, nrow = 350)
colnames(x) <- c("a", "b", "c")
y <- matrix(data = c(10 + x[, "a"] + x[, "b"]^2 + x[, "c"]^3), ncol = 1)
colnames(y) <- "y"
x.test <- x[1:10, ]
y.test <- y[1:10]
x <- x[-c(1:10), ]
y <- y[-c(1:10)]

mod <- gmdh.combi(X = x, y = y)
pred <- predict(mod, x.test)
summary(sqrt((pred - y.test)^2))




