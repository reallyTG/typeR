library(olsrr)


### Name: ols_test_correlation
### Title: Correlation test for normality
### Aliases: ols_test_correlation ols_corr_test

### ** Examples

model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_test_correlation(model)




