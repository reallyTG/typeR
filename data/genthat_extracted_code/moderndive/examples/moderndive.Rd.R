library(moderndive)


### Name: moderndive
### Title: moderndive - Tidyverse-Friendly Introductory Linear Regression
### Aliases: moderndive moderndive-package

### ** Examples

library(moderndive)

# Fit regression model:
mpg_model <- lm(mpg ~ hp, data = mtcars)

# Regression tables:
get_regression_table(mpg_model)

# Information on each point in a regression:
get_regression_points(mpg_model)

# Regression summaries
get_regression_summaries(mpg_model)



