library(olsrr)


### Name: rvsr_plot_shiny
### Title: Residual vs regressors plot for shiny app
### Aliases: rvsr_plot_shiny

### ** Examples

model <- lm(mpg ~ disp + hp + wt, data = mtcars)
rvsr_plot_shiny(model, mtcars, 'drat')




