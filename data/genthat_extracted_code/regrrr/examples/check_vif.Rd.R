library(regrrr)


### Name: check_vif
### Title: quickly check the vifs in a regression model; for checking
###   multi-collinearity
### Aliases: check_vif

### ** Examples

data(mtcars)
model <- lm(mpg ~ vs + carb + hp + wt + wt * hp , data = mtcars)
check_vif(data = model$model)




