library(glmnetcr)


### Name: coef.glmnetcr
### Title: Extract All Model Coefficients
### Aliases: coef.glmnetcr
### Keywords: methods

### ** Examples

data(diabetes)
x <- diabetes[, 2:dim(diabetes)[2]]
y <- diabetes$y
glmnet.fit <- glmnetcr(x, y)
BIC.model <- select.glmnetcr(glmnet.fit)
estimates <- coef(glmnet.fit, s = BIC.model)



