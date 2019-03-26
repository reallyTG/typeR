library(olsrr)


### Name: ols_sbic
### Title: Sawa's bayesian information criterion
### Aliases: ols_sbic

### ** Examples

full_model <- lm(mpg ~ ., data = mtcars)
model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_sbic(model, full_model)




