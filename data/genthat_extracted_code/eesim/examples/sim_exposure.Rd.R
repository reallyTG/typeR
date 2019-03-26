library(eesim)


### Name: sim_exposure
### Title: Simulate time series of exposure values
### Aliases: sim_exposure

### ** Examples

sim_exposure(n = 5, central = 0.25, exposure_type = "binary")
sim_exposure(n = 5, central = 100, sd = 10, exposure_type = "continuous")
library(ggplot2)
x_cont <- sim_exposure(n = 1000, central = 100, sd = 10,
                       exposure_type = "continuous",
                       trend = "cos1linear", amp = 0.6)
ggplot(x_cont, aes(x = date, y = x)) + geom_point()
x_cust <- sim_exposure(n = 1000, cust_exp_func = "custom_exposure",
                       cust_exp_args = list(metric = "temp"))
ggplot(x_cust, aes(x = date, y = x)) + geom_point()



