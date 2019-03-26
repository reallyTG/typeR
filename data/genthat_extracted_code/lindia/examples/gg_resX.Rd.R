library(lindia)


### Name: gg_resX
### Title: Generate residual plot of residuals against predictors
### Aliases: gg_resX

### ** Examples

library(MASS)
data(Cars93)
# a regression with categorical variable
cars_lm <- lm(Price ~ Passengers + Length + RPM + Origin, data = Cars93)
gg_resX(cars_lm)
# customize which diagnostic plot is included by have gg_resX to return a list of plots
plots <- gg_resX(cars_lm, plot.all = FALSE)
names(plots)     # get name of the plots
exclude_plots <- plots[-1 ]    #exclude certain residual plots
include_plots <- plots[1]      # include certain residual plots
plot_all(exclude_plots)       # make use of plot_all() in lindia
plot_all(include_plots)



