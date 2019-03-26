library(olsrr)


### Name: ols_step_forward_aic
### Title: Stepwise AIC forward regression
### Aliases: ols_step_forward_aic ols_step_forward_aic.default
###   plot.ols_step_forward_aic ols_stepaic_forward

### ** Examples

# stepwise forward regression
model <- lm(y ~ ., data = surgical)
ols_step_forward_aic(model)

# stepwise forward regression plot
model <- lm(y ~ ., data = surgical)
k <- ols_step_forward_aic(model)
plot(k)

# final model
k$model




