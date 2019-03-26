library(glmpathcr)


### Name: plot.glmpathcr
### Title: Plots the Regularization Path Computed from glmpathcr
### Aliases: plot.glmpathcr
### Keywords: methods

### ** Examples

data(diabetes)
x <- diabetes[, 2:dim(diabetes)[2]]
y <- diabetes$y
fit <- glmpathcr(x, y)
plot(fit, xvar="step")



