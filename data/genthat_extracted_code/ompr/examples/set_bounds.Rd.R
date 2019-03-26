library(ompr)


### Name: set_bounds
### Title: Set the bounds of a variable
### Aliases: set_bounds set_bounds_

### ** Examples

library(magrittr)
MIPModel() %>%
 add_variable(x[i], i = 1:5) %>%
 add_constraint(x[i] >= 1, i = 1:5) %>% # creates 5 constraints
 set_bounds(x[i], lb = 3, i = 1:3)




