library(glmpathcr)


### Name: nonzero.coef
### Title: Extract Non-Zero Model Coefficients
### Aliases: nonzero.coef
### Keywords: misc

### ** Examples

data(diabetes)
x <- diabetes[, 2:dim(diabetes)[2]]
y <- diabetes$y
fit <- glmpathcr(x, y)
step <- model.select(fit, which="BIC")
nonzero.coef(fit, s = step)



