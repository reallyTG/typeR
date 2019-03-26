library(glmnetcr)


### Name: select.glmnetcr
### Title: Select Step of Optimal Fitted AIC or BIC CR Model
### Aliases: select.glmnetcr
### Keywords: misc

### ** Examples

data(diabetes)
x <- diabetes[, 2:dim(diabetes)[2]]
y <- diabetes$y
glmnet.fit <- glmnetcr(x, y)
AIC <- select.glmnetcr(glmnet.fit, which = "AIC")
AIC
nonzero.glmnetcr(glmnet.fit, s = AIC)



