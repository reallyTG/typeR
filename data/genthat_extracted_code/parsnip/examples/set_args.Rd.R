library(parsnip)


### Name: set_args
### Title: Change elements of a model specification
### Aliases: set_args set_mode

### ** Examples

rand_forest()

rand_forest() %>%
  set_args(mtry = 3, importance = TRUE) %>%
  set_mode("regression")




