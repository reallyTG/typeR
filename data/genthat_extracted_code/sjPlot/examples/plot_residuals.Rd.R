library(sjPlot)


### Name: plot_residuals
### Title: Plot predicted values and their residuals
### Aliases: plot_residuals

### ** Examples

data(efc)
# fit model
fit <- lm(neg_c_7 ~ c12hour + e17age + e42dep, data = efc)

# plot residuals for all independent variables
plot_residuals(fit)

# remove some independent variables from output
plot_residuals(fit, remove.estimates = c("e17age", "e42dep"))




