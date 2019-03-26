library(gensvm)


### Name: fitted.gensvm.grid
### Title: Fitted labels for the GenSVMGrid class
### Aliases: fitted.gensvm.grid

### ** Examples

x <- iris[, -5]
y <- iris[, 5]

# fit GenSVM and compute training set predictions
fit <- gensvm(x, y)
yhat <- fitted(fit)

# compute the accuracy with gensvm.accuracy
gensvm.accuracy(y, yhat)




