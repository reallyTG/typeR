library(glmnetcr)


### Name: nonzero.glmnetcr
### Title: Extract Non-Zero Model Coefficients
### Aliases: nonzero.glmnetcr
### Keywords: misc

### ** Examples

data(diabetes)
x <- diabetes[, 2:dim(diabetes)[2]]
y <- diabetes$y
glmnet.fit <- glmnetcr(x, y)
AIC.step <- select.glmnetcr(glmnet.fit, which = "AIC")
nonzero.glmnetcr(glmnet.fit, s = AIC.step)



