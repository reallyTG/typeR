library(glmpathcr)


### Name: predict.glmpathcr
### Title: Predicted Class and Fitted Probabilities from glmpathcr Object
### Aliases: predict.glmpathcr fitted.glmpathcr
### Keywords: methods

### ** Examples

data(diabetes)
x <- diabetes[, 2:dim(diabetes)[2]]
y <- diabetes$y
fit <- glmpathcr(x, y)
pred <- predict(fit)
table(pred, y)
pred <- predict(fit, which="AIC", type="probs")



