library(modeldb)


### Name: add_dummy_variables
### Title: Creates dummy variables
### Aliases: add_dummy_variables

### ** Examples

library(dplyr)

mtcars %>%
  add_dummy_variables(cyl, values = c(4, 6, 8))

mtcars %>%
  add_dummy_variables(cyl, auto_values = TRUE)




