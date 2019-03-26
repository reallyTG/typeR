library(PAutilities)


### Name: get_transition_info
### Title: Convert a set of predicted and actual activity transitions to an
###   object that can be analyzed
### Aliases: get_transition_info

### ** Examples

predictions <- sample(c(0,1), 100, TRUE, c(3, 1))
references  <- sample(c(0,1), 100, TRUE, c(4,1))
get_transition_info(predictions, references, 10)



