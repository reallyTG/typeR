library(qrmtools)


### Name: tail_plot
### Title: Plot of a Non-Parametric Tail Estimator
### Aliases: tail_plot
### Keywords: hplot

### ** Examples

data(fire)
u <- 10 # threshold choice
tail_plot(fire, threshold = u, log = "", type = "b") # => need log-scale
tail_plot(fire, threshold = u, type = "s") # as a step function
fit <- fit_GPD_MLE(fire[fire > u] - u) # fit GPD to excesses (POT method)
tail_plot(fire, threshold = u, # without log-scale
          shape = fit$par[["shape"]], scale = fit$par[["scale"]], log = "")
tail_plot(fire, threshold = u, # highlights linearity
          shape = fit$par[["shape"]], scale = fit$par[["scale"]])



