library(olsrr)


### Name: ols_test_f
### Title: F test
### Aliases: ols_test_f ols_f_test

### ** Examples

# model
model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)

# using fitted values
ols_test_f(model)

# using all predictors of the model
ols_test_f(model, rhs = TRUE)

# using fitted values
ols_test_f(model, vars = c('disp', 'hp'))




