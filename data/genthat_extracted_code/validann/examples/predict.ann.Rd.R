library(validann)


### Name: predict.ann
### Title: Predict new examples using a trained neural network.
### Aliases: predict.ann

### ** Examples

## fit 1-hidden node `ann' model to ar9 data
data("ar9")
samp <- sample(1:1000, 200)
y <- ar9[samp, ncol(ar9)]
x <- ar9[samp, -ncol(ar9)]
x <- x[, c(1,4,9)]

fit <- ann(x, y, size = 1, act_hid = "tanh", act_out = "linear", rang = 0.1)

## get model predictions based on a new sample of ar9 data.
samp <- sample(1:1000, 200)
y <- ar9[samp, ncol(ar9)]
x <- ar9[samp, -ncol(ar9)]
x <- x[, c(1,4,9)]

sim <- predict(fit, newdata = x)

## if derivatives are required...
tmp <- predict(fit, newdata = x, derivs = TRUE)
sim <- tmp$values
derivs <- tmp$derivs



