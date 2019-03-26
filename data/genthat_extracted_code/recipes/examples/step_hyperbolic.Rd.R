library(recipes)


### Name: step_hyperbolic
### Title: Hyperbolic Transformations
### Aliases: step_hyperbolic tidy.step_hyperbolic
### Keywords: datagen

### ** Examples

set.seed(313)
examples <- matrix(rnorm(40), ncol = 2)
examples <- as.data.frame(examples)

rec <- recipe(~ V1 + V2, data = examples)

cos_trans <- rec  %>%
  step_hyperbolic(all_predictors(),
                  func = "cos", inverse = FALSE)

cos_obj <- prep(cos_trans, training = examples)

transformed_te <- bake(cos_obj, examples)
plot(examples$V1, transformed_te$V1)

tidy(cos_trans, number = 1)
tidy(cos_obj, number = 1)



