library(dials)


### Name: range_validate
### Title: Tools for working with parameter ranges
### Aliases: range_validate range_get range_set

### ** Examples

library(dplyr)
my_lambda <- 
  penalty %>% 
  value_set(-4:-1) 
try(my_lambda %>% range_validate(c(-10, NA)), silent = TRUE) %>% print()

range_get(my_lambda)

range_set(my_lambda, c(-10, 2)) %>% range_get()



