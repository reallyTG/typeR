library(PAutilities)


### Name: summary.transition
### Title: Evaluate the effectiveness of predicted transitions for an
###   object of class 'transition'
### Aliases: summary.transition get_preferences
### Keywords: internal

### ** Examples

predictions <- sample(c(0,1), 100, TRUE, c(3, 1))
references  <- sample(c(0,1), 100, TRUE, c(4,1))
transitions <- get_transition_info(predictions, references, 10)
summary(transitions)



