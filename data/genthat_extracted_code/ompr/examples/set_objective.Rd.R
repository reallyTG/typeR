library(ompr)


### Name: set_objective
### Title: Set the model objective
### Aliases: set_objective set_objective_

### ** Examples

library(magrittr)
MIPModel() %>%
 add_variable(x, lb = 2) %>%
 add_variable(y, lb = 40) %>%
 set_objective(x + y, sense = "min")




