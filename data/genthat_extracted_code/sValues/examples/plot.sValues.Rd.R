library(sValues)


### Name: plot.sValues
### Title: Plot method for S-values
### Aliases: plot.sValues

### ** Examples

# growth regressions example
data(economic_growth)
eg_sv <- sValues(GR6096 ~ ., data = economic_growth)
plot(eg_sv, R2_bounds = c(0.5, 1))
plot(eg_sv, R2_bounds = c(0.1, 1))
plot(eg_sv, type = "beta_plot", variable = "OPENDEC1", error_bar = FALSE)
plot(eg_sv, type = "beta_plot", variable = "OPENDEC1", error_bar = TRUE)




