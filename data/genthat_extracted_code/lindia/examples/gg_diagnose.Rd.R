library(lindia)


### Name: gg_diagnose
### Title: Plot all diagnostic plots given fitted linear regression line.
### Aliases: gg_diagnose

### ** Examples

library(MASS)
data(Cars93)
# a regression with categorical variable
cars_lm <- lm(Price ~ Passengers + Length + RPM + Origin, data = Cars93)
gg_diagnose(cars_lm)
# customize which diagnostic plot is included
plots <- gg_diagnose(cars_lm, plot.all = FALSE)
names(plots)     # get name of the plots
exclude_plots <- plots[-c(1, 3) ]    #exclude certain diagnostics plots
include_plots <- plots[c(1, 3)]      # include certain diagnostics plots
plot_all(exclude_plots)              # make use of plot_all() in lindia
plot_all(include_plots)



