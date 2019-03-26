library(olsrr)


### Name: ols_step_backward_p
### Title: Stepwise backward regression
### Aliases: ols_step_backward_p ols_step_backward_p.default
###   plot.ols_step_backward_p ols_step_backward

### ** Examples

# stepwise backward regression
model <- lm(y ~ ., data = surgical)
ols_step_backward_p(model)

# stepwise backward regression plot
model <- lm(y ~ ., data = surgical)
k <- ols_step_backward_p(model)
plot(k)

# final model
k$model




