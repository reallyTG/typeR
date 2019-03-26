library(weibulltools)


### Name: plot_pop
### Title: Add Population Line to an Existing Grid
### Aliases: plot_pop

### ** Examples

x <- rweibull(n = 100, shape = 1, scale = 20000)
grid_weibull <- plot_layout(x = x,
                            distribution = "weibull",
                            title_main = "Weibull Analysis",
                            title_x = "Time to Failure",
                            title_y = "Failure Probability")
pop_weibull <- plot_pop(p_obj = grid_weibull,
                        x = x, params = c(20000, 1),
                        distribution = "weibull", color = I("green"),
                        title_trace = "Population")




