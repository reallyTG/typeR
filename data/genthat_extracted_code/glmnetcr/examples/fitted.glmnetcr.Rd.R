library(glmnetcr)


### Name: fitted.glmnetcr
### Title: AIC, BIC, Predicted Class, and Fitted Probabilities of Class
###   Membership
### Aliases: fitted.glmnetcr
### Keywords: methods

### ** Examples

data(diabetes)
x <- diabetes[, 2:dim(diabetes)[2]]
y <- diabetes$y
glmnet.fit <- glmnetcr(x, y)
fitted(glmnet.fit, s = select.glmnetcr(glmnet.fit))



