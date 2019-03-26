library(olsrr)


### Name: ols_mallows_cp
### Title: Mallow's Cp
### Aliases: ols_mallows_cp

### ** Examples

full_model <- lm(mpg ~ ., data = mtcars)
model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_mallows_cp(model, full_model)




