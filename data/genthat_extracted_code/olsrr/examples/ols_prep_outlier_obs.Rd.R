library(olsrr)


### Name: ols_prep_outlier_obs
### Title: Cooks' D outlier observations
### Aliases: ols_prep_outlier_obs

### ** Examples

model <- lm(mpg ~ disp + hp + wt, data = mtcars)
k <- ols_prep_cdplot_data(model)
ols_prep_outlier_obs(k)




