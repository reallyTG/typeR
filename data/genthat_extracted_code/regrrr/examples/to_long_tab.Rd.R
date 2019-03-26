library(regrrr)


### Name: to_long_tab
### Title: Convert the regression result to the long format: the standard
###   errors are in parentheses and beneath the betas
### Aliases: to_long_tab

### ** Examples

data(mtcars)
m1 <- lm(mpg ~ vs + carb + hp + wt + wt * hp , data = mtcars)
to_long_tab(reg.coef = summary(m1)$coef) 




