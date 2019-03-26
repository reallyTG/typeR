library(ompr)


### Name: add_constraint
### Title: Add a constraint
### Aliases: add_constraint add_constraint_

### ** Examples

library(magrittr)
MIPModel() %>%
 add_variable(x[i], i = 1:5) %>%
 add_constraint(x[i] >= 1, i = 1:5) # creates 5 constraints




