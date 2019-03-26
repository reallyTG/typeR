library(olsrr)


### Name: ols_prep_regress_y
### Title: Regress y on other predictors
### Aliases: ols_prep_regress_y

### ** Examples

model <- lm(mpg ~ disp + hp + wt, data = mtcars)
data <- ols_prep_avplot_data(model)
ols_prep_regress_y(data, 1)




