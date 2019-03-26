library(olsrr)


### Name: ols_test_score
### Title: Score test
### Aliases: ols_test_score ols_score_test

### ** Examples

# model
model <- lm(mpg ~ disp + hp + wt, data = mtcars)

# using fitted values of the model
ols_test_score(model)

# using predictors from the model
ols_test_score(model, rhs = TRUE)

# specify predictors from the model
ols_test_score(model, vars = c('disp', 'wt'))




