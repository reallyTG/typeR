library(healthcareai)


### Name: get_variable_importance
### Title: Get variable importances
### Aliases: get_variable_importance

### ** Examples

m <- machine_learn(mtcars, outcome = mpg, models = "rf", tune = FALSE)
(vi <- get_variable_importance(m))
plot(vi)



