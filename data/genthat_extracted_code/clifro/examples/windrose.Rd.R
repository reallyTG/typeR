library(clifro)


### Name: windrose
### Title: Plot a windrose
### Aliases: windrose

### ** Examples

# Create some dummy wind data with predominant south to westerly winds, and
# occasional yet higher wind speeds from the NE (not too dissimilar to
# Auckland).

wind_df = data.frame(wind_speeds = c(rweibull(80, 2, 4), rweibull(20, 3, 9)),
                     wind_dirs = c(rnorm(80, 135, 55), rnorm(20, 315, 35)) %% 360,
                     station = rep(rep(c("Station A", "Station B"), 2),
                                   rep(c(40, 10), each = 2)))

# Plot a simple windrose using all the defaults, ignoring any facet variable
with(wind_df, windrose(wind_speeds, wind_dirs))

# Create custom speed bins, add a legend title, and change to a B&W theme
with(wind_df, windrose(wind_speeds, wind_dirs,
                       speed_cuts = c(3, 6, 9, 12),
                       legend_title = "Wind Speed\n(m/s)",
                       legend.title.align = .5,
                       ggtheme = "bw",
                       col_pal = "Greys"))
                       
# Note that underscore-separated arguments come from the windrose method, and
# period-separated arguments come from ggplot2::theme().

# Include a facet variable with one level
with(wind_df, windrose(wind_speeds, wind_dirs, "Artificial Auckland Wind"))

# Plot a windrose for each level of the facet variable (each station)
with(wind_df, windrose(wind_speeds, wind_dirs, station, n_col = 2))

## Not run: 
##D # Save the plot as a png to the current working directory
##D library(ggplot2)
##D ggsave("my_windrose.png")
## End(Not run)




