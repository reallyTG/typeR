library(olsrr)


### Name: ols_prep_cdplot_outliers
### Title: Cooks' d outlier data
### Aliases: ols_prep_cdplot_outliers

### ** Examples

model <- lm(mpg ~ disp + hp + wt, data = mtcars)
k <- ols_prep_cdplot_data(model)
ols_prep_cdplot_outliers(k)




