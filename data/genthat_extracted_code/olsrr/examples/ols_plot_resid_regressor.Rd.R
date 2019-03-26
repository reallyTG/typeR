library(olsrr)


### Name: ols_plot_resid_regressor
### Title: Residual vs regressor plot
### Aliases: ols_plot_resid_regressor ols_rvsr_plot

### ** Examples

model <- lm(mpg ~ disp + hp + wt, data = mtcars)
ols_plot_resid_regressor(model, drat)




