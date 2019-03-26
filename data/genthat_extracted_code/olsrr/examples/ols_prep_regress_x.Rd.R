library(olsrr)


### Name: ols_prep_regress_x
### Title: Regress predictor on other predictors
### Aliases: ols_prep_regress_x

### ** Examples

model <- lm(mpg ~ disp + hp + wt, data = mtcars)
data <- ols_prep_avplot_data(model)
ols_prep_regress_x(data, 1)




