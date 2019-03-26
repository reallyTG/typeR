library(validann)


### Name: ann
### Title: Fit Artificial Neural Networks.
### Aliases: ann

### ** Examples

## fit 1-hidden node ann model with tanh activation at the hidden layer and
## linear activation at the output layer.
## Use 200 random samples from ar9 dataset.
## ---
data("ar9")
samp <- sample(1:1000, 200)
y <- ar9[samp, ncol(ar9)]
x <- ar9[samp, -ncol(ar9)]
x <- x[, c(1,4,9)]
fit <- ann(x, y, size = 1, act_hid = "tanh", act_out = "linear", rang = 0.1)

## fit 3-hidden node ann model to ar9 data with user-defined AR(1) objective
## function
## ---
ar1_sse <- function(y, y_hat, par_of) {
  err <- y - y_hat
  err[-1] <- err[-1] - par_of * err[-length(y)]
  sum(err ^ 2)
}
fit <- ann(x, y, size = 3, act_hid = "tanh", act_out = "linear", rang = 0.1,
           objfn = ar1_sse, par_of = 0.7)




