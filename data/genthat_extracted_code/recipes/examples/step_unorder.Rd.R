library(recipes)


### Name: step_unorder
### Title: Convert Ordered Factors to Unordered Factors
### Aliases: step_unorder tidy.step_unorder
### Keywords: datagen

### ** Examples

lmh <- c("Low", "Med", "High")

examples <- data.frame(X1 = factor(rep(letters[1:4], each = 3)),
                       X2 = ordered(rep(lmh, each = 4),
                                    levels = lmh))

rec <- recipe(~ X1 + X2, data = examples)

factor_trans <- rec  %>%
  step_unorder(all_predictors())

factor_obj <- prep(factor_trans, training = examples)

transformed_te <- bake(factor_obj, examples)
table(transformed_te$X2, examples$X2)

tidy(factor_trans, number = 1)
tidy(factor_obj, number = 1)



