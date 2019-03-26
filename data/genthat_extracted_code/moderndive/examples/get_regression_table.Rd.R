library(moderndive)


### Name: get_regression_table
### Title: Get regression table
### Aliases: get_regression_table

### ** Examples

library(moderndive)

# Fit lm() regression:
mpg_model <- lm(mpg ~ cyl, data = mtcars)

# Get regression table:
get_regression_table(mpg_model)



