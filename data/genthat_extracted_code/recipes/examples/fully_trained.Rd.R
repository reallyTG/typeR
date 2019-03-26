library(recipes)


### Name: fully_trained
### Title: Check to see if a recipe is trained/prepared
### Aliases: fully_trained

### ** Examples

rec <- recipe(Species ~ ., data = iris) %>%
  step_center(all_numeric())

rec %>% fully_trained

rec %>% prep(training = iris) %>% fully_trained



