library(glmpathcr)


### Name: coef.glmpathcr
### Title: Extract All Model Coefficients
### Aliases: coef.glmpathcr
### Keywords: methods

### ** Examples

data(diabetes)
x <- diabetes[, 2:dim(diabetes)[2]]
y <- diabetes$y
fit <- glmpathcr(x, y)
step <- model.select(fit, which="BIC")
## Not run: coef(fit, s = step)



