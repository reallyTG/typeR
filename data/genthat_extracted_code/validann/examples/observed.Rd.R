library(validann)


### Name: observed
### Title: Return observed target values.
### Aliases: observed

### ** Examples

# Get observed values of y used to train ann object `fit'.
# ---
data("ar9")
samp <- sample(1:1000, 200)
y <- ar9[samp, ncol(ar9)]
x <- ar9[samp, -ncol(ar9)]
x <- x[, c(1,4,9)]
fit <- ann(x, y, size = 1, act_hid = "tanh", act_out = "linear", rang = 0.1)
y_obs <- observed(fit)



