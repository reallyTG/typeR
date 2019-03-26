library(atlantistools)


### Name: plot_add_range
### Title: Low level plotting function to add range of observed values to
###   time series plots.
### Aliases: plot_add_range

### ** Examples

# There is no external data so we need to add some noise first!
ex_data <- preprocess$biomass
ex_data$atoutput <- ex_data$atoutput * runif(n = nrow(ex_data), 0, 1)
ex_data$model <- "test"

# Create the timeseries with \code{plot_line}
plot <- plot_line(preprocess$biomass)

# Add the external data as geom_rug with \code{plot_add_range}
plot_add_range(plot, ex_data)



