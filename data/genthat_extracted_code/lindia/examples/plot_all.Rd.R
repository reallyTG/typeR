library(lindia)


### Name: plot_all
### Title: Plot all given plots in a square matrix form.
### Aliases: plot_all

### ** Examples

         library(MASS)
         data(Cars93)
         # a regression with categorical variable
         cars_lm <- lm(Price ~ Passengers + Length + RPM + Origin, data = Cars93)
         plots <- gg_diagnose(cars_lm, plot.all = FALSE)
         names(plots)
         selected.plots <- plots[-c(2, 5)]
         plot_all(selected.plots)
         



