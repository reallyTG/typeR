library(olsrr)


### Name: ols_regress
### Title: Ordinary least squares regression
### Aliases: ols_regress ols_regress.lm

### ** Examples

ols_regress(mpg ~ disp + hp + wt, data = mtcars)

# if model includes interaction terms set iterm to TRUE
ols_regress(mpg ~ disp * wt, data = mtcars, iterm = TRUE)




