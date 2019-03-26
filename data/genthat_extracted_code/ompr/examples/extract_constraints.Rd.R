library(ompr)


### Name: extract_constraints
### Title: Extract the constraint matrix, the right hand side and the sense
###   from a model
### Aliases: extract_constraints

### ** Examples

library(magrittr)
model <- MIPModel() %>%
  add_variable(x[i], i = 1:3) %>%
  add_variable(y[i], i = 1:3) %>%
  add_constraint(x[i] + y[i] <= 1, i = 1:3)
extract_constraints(model)



