library(ompr)


### Name: variable_types
### Title: Variable types of a model
### Aliases: variable_types

### ** Examples

library(magrittr)
model <- MIPModel() %>%
  add_variable(x, type = "binary") %>%
  add_variable(y, type = "continuous") %>%
  add_variable(z, type = "integer")
variable_types(model)



