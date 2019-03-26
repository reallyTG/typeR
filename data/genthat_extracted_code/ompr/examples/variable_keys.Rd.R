library(ompr)


### Name: variable_keys
### Title: Get all unique names of the model variables
### Aliases: variable_keys

### ** Examples

library(magrittr)
model <- MIPModel() %>%
  add_variable(x[i], i = 1:3)
variable_keys(model)



