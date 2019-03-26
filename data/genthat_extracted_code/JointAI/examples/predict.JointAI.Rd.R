library(JointAI)


### Name: predict.JointAI
### Title: Predict values from an object of class JointAI
### Aliases: predict.JointAI

### ** Examples

# fit model
mod <- lm_imp(y ~ C1 + C2 + I(C2^2), data = wideDF, n.iter = 100)

# create dataset for prediction
newDF <- predDF(mod, var = "C2")

# obtain predicted values
pred <- predict(mod, newdata = newDF)

# plot predicted values and 95% confidence band
plot(newDF$C2, pred$fit, type = "l", ylim = range(pred$quantiles),
     xlab = "C2", ylab = "predicted values")
matplot(newDF$C2, t(pred$quantiles), lty = 2, add = TRUE, type = "l", col = 1)




