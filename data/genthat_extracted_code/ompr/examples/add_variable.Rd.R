library(ompr)


### Name: add_variable
### Title: Add a variable to the model
### Aliases: add_variable add_variable_

### ** Examples

library(magrittr)
MIPModel() %>%
 add_variable(x) %>% # creates 1 variable named x
 add_variable(y[i], i = 1:10, i %% 2 == 0,
               type = "binary") # creates 4 variables




