library(weibulltools)


### Name: plot_layout
### Title: Layout of the Probability Plot
### Aliases: plot_layout

### ** Examples

x_layout <- seq(1e-5, 1e+07, length.out = 10)
grid_weibull <- plot_layout(x = x_layout,
                            distribution = "weibull",
                            title_main = "Weibull Analysis",
                            title_x = "Time to Failure",
                            title_y = "Failure Probability in %")



