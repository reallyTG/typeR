library(recipes)


### Name: formula.recipe
### Title: Create a Formula from a Prepared Recipe
### Aliases: formula.recipe

### ** Examples


formula(recipe(Species + Sepal.Length ~ ., data = iris))

iris_rec <- recipe(Species ~ ., data = iris) %>%
  step_center(all_numeric()) %>%
  prep(training = iris)
formula(iris_rec)



