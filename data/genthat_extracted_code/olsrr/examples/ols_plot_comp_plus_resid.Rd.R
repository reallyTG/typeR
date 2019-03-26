library(olsrr)


### Name: ols_plot_comp_plus_resid
### Title: Residual plus component plot
### Aliases: ols_plot_comp_plus_resid ols_rpc_plot

### ** Examples

model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_plot_comp_plus_resid(model)




