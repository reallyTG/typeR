library(moderndive)


### Name: get_regression_points
### Title: Get regression points
### Aliases: get_regression_points

### ** Examples

library(moderndive)
library(dplyr)
library(tibble)

# Fit lm() regression:
mpg_model <- lm(mpg ~ cyl, data = mtcars)

# Get information on all points in regression:
get_regression_points(mpg_model)

# Create training and test set based on mtcars: 
mtcars <- mtcars %>% 
  rownames_to_column(var = "model")
training_set <- mtcars %>% 
  sample_frac(0.5)
test_set <- mtcars %>% 
  anti_join(training_set, by = "model")

# Fit model to training set:
mpg_model_train <- lm(mpg ~ cyl, data = training_set)

# Make predictions on test set:
get_regression_points(mpg_model_train, newdata = test_set)



