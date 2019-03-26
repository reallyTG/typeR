library(olsrr)


### Name: ols_test_normality
### Title: Test for normality
### Aliases: ols_test_normality ols_test_normality.lm ols_norm_test

### ** Examples

model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_test_normality(model)




