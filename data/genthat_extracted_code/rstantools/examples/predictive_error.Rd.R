library(rstantools)


### Name: predictive_error
### Title: Generic function and default method for predictive errors
### Aliases: predictive_error predictive_error.default

### ** Examples

# default method
y <- rnorm(10)
ypred <- matrix(rnorm(500), 50, 10)
pred_errors <- predictive_error(ypred, y)
dim(pred_errors)
head(pred_errors)

# Also see help("predictive_error", package = "rstanarm")




