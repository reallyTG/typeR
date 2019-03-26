library(ggvis)


### Name: handle_resize
### Title: Handlers and interactive inputs for plot sizing.
### Aliases: handle_resize plot_width plot_height

### ** Examples

# This example just prints out the current dimensions to the console
mtcars %>% ggvis(~mpg, ~wt) %>%
  layer_points() %>%
  handle_resize(function(width, height, ...) cat(width, "x", height, "\n"))

# Use plot_width() and plot_height() to dynamically get the plot size
# inside the plot.
mtcars %>% ggvis(~mpg, ~wt) %>% layer_text(text := plot_width())
mtcars %>% ggvis(~mpg, ~wt) %>% layer_text(text := plot_height())



