library(modeldb)


### Name: linear_regression_db
### Title: Fits a Linear Regression model
### Aliases: linear_regression_db

### ** Examples

library(dplyr)

mtcars %>%
  select(mpg, wt, qsec) %>%
  linear_regression_db(mpg)




