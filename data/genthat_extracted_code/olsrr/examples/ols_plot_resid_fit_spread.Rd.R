library(olsrr)


### Name: ols_plot_resid_fit_spread
### Title: Residual fit spread plot
### Aliases: ols_plot_resid_fit_spread ols_plot_fm ols_plot_resid_spread
###   ols_rfs_plot ols_rsd_plot ols_fm_plot

### ** Examples

# model
model <- lm(mpg ~ disp + hp + wt, data = mtcars)

# residual fit spread plot
ols_plot_resid_fit_spread(model)

# fit mean plot
ols_plot_fm(model)

# residual spread plot
ols_plot_resid_spread(model)




