library(atlantistools)


### Name: plot_add_box
### Title: Low level plotting function to add sudo confidence range to
###   calibration plots.
### Aliases: plot_add_box

### ** Examples

# Make sure to use a relative timeseries generated with \code{convert_relative_initial}.
df <- convert_relative_initial(preprocess$structn_age)

# Create the plot with \code{plot_line}.
plot <- plot_line(df, col = "agecl")

# Add lower and upper range.
plot_add_box(plot)

# You can set the upper and lower range as you like!
plot_add_box(plot, range = c(0.8, 0.4))



