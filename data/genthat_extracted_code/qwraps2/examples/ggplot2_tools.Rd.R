library(qwraps2)


### Name: ggplot2_extract_legend
### Title: ggplot2 tools
### Aliases: ggplot2_extract_legend

### ** Examples

# a simple plot
my_plot <- 
  ggplot2::ggplot(mtcars) + 
  ggplot2::aes(x = wt, y = mpg, color = wt, shape = factor(cyl)) + 
  ggplot2::geom_point()

my_plot

# extract the legend.  the return object is a list with two elements, the first
# element is the legend, the second is the original plot sans legend.
temp <- ggplot2_extract_legend(my_plot)

# view just the legend.  This can be done via a call to the object or using
# plot or print.
temp
plot(temp[[1]])

# the original plot without the legened
plot(temp[[2]])




