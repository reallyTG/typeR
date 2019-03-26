library(insight)


### Name: find_predictors
### Title: Find names of model predictors
### Aliases: find_predictors

### ** Examples

data(mtcars)
m <- lm(mpg ~ wt + cyl + vs, data = mtcars)
find_predictors(m)



