library(olsrr)


### Name: ols_step_both_p
### Title: Stepwise regression
### Aliases: ols_step_both_p ols_step_both_p.default plot.ols_step_both_p
###   ols_stepwise

### ** Examples

# stepwise regression
model <- lm(y ~ ., data = surgical)
ols_step_both_p(model)

# stepwise regression plot
model <- lm(y ~ ., data = surgical)
k <- ols_step_both_p(model)
plot(k)

# final model
k$model




