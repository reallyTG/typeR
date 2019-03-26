library(insight)


### Name: get_predictors
### Title: Get the data from predictor variables
### Aliases: get_predictors

### ** Examples

m <- lm(mpg ~ wt + cyl + vs, data = mtcars)
head(get_predictors(m))



