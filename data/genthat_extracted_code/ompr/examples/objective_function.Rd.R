library(ompr)


### Name: objective_function
### Title: Extract the objective function from a model
### Aliases: objective_function

### ** Examples

library(magrittr)
model <- MIPModel() %>%
  add_variable(x[i], i = 1:5) %>%
  set_objective(sum_expr(i * x[i], i = 1:5) + 10)
objective_function(model)



