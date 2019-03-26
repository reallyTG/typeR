library(ompr)


### Name: variable_bounds
### Title: Variable lower and upper bounds of a model
### Aliases: variable_bounds

### ** Examples

library(magrittr)
model <- MIPModel() %>%
  add_variable(x, type = "binary") %>%
  add_variable(y, type = "continuous", lb = 2) %>%
  add_variable(z, type = "integer", ub = 3)
variable_bounds(model)



