library(glmpathcr)


### Name: glmpathcr
### Title: Fit Penalized Continuation Ratio Model
### Aliases: glmpathcr
### Keywords: models classif

### ** Examples

data(diabetes)
x <- diabetes[, 2:dim(diabetes)[2]]
y <- diabetes$y
fit <- glmpathcr(x, y)



