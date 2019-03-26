library(ompr)


### Name: nvars
### Title: Number of variables of a model
### Aliases: nvars

### ** Examples

library(magrittr)
model <- MIPModel() %>%
  add_variable(x[i], i = 1:10, type = "binary") %>%
  add_variable(y[i], i = 1:5, type = "continuous") %>%
  add_variable(z[i], i = 1:2, type = "integer")
nvars(model)



