library(olsrr)


### Name: ols_step_backward_aic
### Title: Stepwise AIC backward regression
### Aliases: ols_step_backward_aic ols_step_backward_aic.default
###   plot.ols_step_backward_aic ols_stepaic_backward

### ** Examples

# stepwise backward regression
model <- lm(y ~ ., data = surgical)
ols_step_backward_aic(model)

# stepwise backward regression plot
model <- lm(y ~ ., data = surgical)
k <- ols_step_backward_aic(model)
plot(k)

# final model
k$model




