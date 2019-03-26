library(recipes)


### Name: step_factor2string
### Title: Convert Factors to Strings
### Aliases: step_factor2string tidy.step_factor2string
### Keywords: datagen

### ** Examples

data(okc)

rec <- recipe(~ diet + location, data = okc)

rec <- rec %>%
  step_string2factor(diet)

factor_test <- rec %>%
  prep(training = okc,
       strings_as_factors = FALSE,
       retain = TRUE) %>%
  juice
# diet is a
class(factor_test$diet)

rec <- rec %>%
  step_factor2string(diet)

string_test <- rec %>%
  prep(training = okc,
       strings_as_factors = FALSE,
       retain = TRUE) %>%
  juice
# diet is a
class(string_test$diet)

tidy(rec, number = 1)



