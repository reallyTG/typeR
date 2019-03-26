library(recipes)


### Name: detect_step
### Title: Detect if a particular step or check is used in a recipe
### Aliases: detect_step

### ** Examples

rec <- recipe(Species ~ ., data = iris) %>%
  step_intercept()

detect_step(rec, "step_intercept")



