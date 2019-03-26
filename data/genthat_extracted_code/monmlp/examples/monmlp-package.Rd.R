library(monmlp)


### Name: monmlp-package
### Title: Monotone Multi-Layer Perceptron Neural Network
### Aliases: monmlp-package monmlp
### Keywords: package

### ** Examples

set.seed(123)
x <- as.matrix(seq(-10, 10, length = 100))
y <- logistic(x) + rnorm(100, sd = 0.2)

dev.new()
plot(x, y)
lines(x, logistic(x), lwd = 10, col = "gray")

## MLP w/ 2 hidden nodes
w.mlp <- monmlp.fit(x = x, y = y, hidden1 = 2, iter.max = 500)
lines(x, attr(w.mlp, "y.pred"), col = "red", lwd = 3)

## MLP w/ 2 hidden-layers (2 nodes each) and early stopping
w.stp <- monmlp.fit(x = x, y = y, hidden1 = 2, hidden2 = 2,
                    bag = TRUE, iter.max = 500, iter.stopped = 10)
lines(x, attr(w.stp, "y.pred"), col = "orange", lwd = 3)

## MONMLP w/ 2 hidden nodes
w.mon <- monmlp.fit(x = x, y = y, hidden1 = 2, monotone = 1,
                    iter.max = 500)
lines(x, attr(w.mon, "y.pred"), col = "blue", lwd = 3)



