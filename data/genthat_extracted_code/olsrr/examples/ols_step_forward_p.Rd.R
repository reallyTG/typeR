library(olsrr)


### Name: ols_step_forward_p
### Title: Stepwise forward regression
### Aliases: ols_step_forward_p ols_step_forward_p.default
###   plot.ols_step_forward_p ols_step_forward

### ** Examples

# stepwise forward regression
model <- lm(y ~ ., data = surgical)
ols_step_forward_p(model)

# stepwise forward regression plot
model <- lm(y ~ ., data = surgical)
k <- ols_step_forward_p(model)
plot(k)

# final model
k$model




