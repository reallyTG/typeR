library(ompr)


### Name: nconstraints
### Title: Number of variables (rows) of the model
### Aliases: nconstraints

### ** Examples

library(magrittr)
model <- MIPModel() %>%
  add_variable(x) %>%
  add_variable(y[i], i = 1:10)
nconstraints(model) # 11



