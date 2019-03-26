library(PAutilities)


### Name: plot.transition
### Title: Plot the transitions and matchings from a 'transition' object
### Aliases: plot.transition

### ** Examples

predictions <- sample(c(0,1), 100, TRUE, c(3, 1))
references  <- sample(c(0,1), 100, TRUE, c(4,1))
transitions <- get_transition_info(predictions, references, 10)
plot(transitions)



