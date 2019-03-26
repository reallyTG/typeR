library(recipes)


### Name: step_inverse
### Title: Inverse Transformation
### Aliases: step_inverse tidy.step_inverse
### Keywords: datagen

### ** Examples

set.seed(313)
examples <- matrix(runif(40), ncol = 2)
examples <- data.frame(examples)

rec <- recipe(~ X1 + X2, data = examples)

inverse_trans <- rec  %>%
  step_inverse(all_predictors())

inverse_obj <- prep(inverse_trans, training = examples)

transformed_te <- bake(inverse_obj, examples)
plot(examples$X1, transformed_te$X1)

tidy(inverse_trans, number = 1)
tidy(inverse_obj, number = 1)



