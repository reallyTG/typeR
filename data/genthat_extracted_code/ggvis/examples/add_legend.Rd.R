library(ggvis)


### Name: add_legend
### Title: Add a vega legend specification to a ggvis plot
### Aliases: add_legend hide_legend

### ** Examples

mtcars %>% ggvis(x = ~wt, y = ~mpg, fill = ~cyl) %>%
  layer_points() %>%
  add_legend("fill", title = "Cylinders")

# Suppress legend with hide_legend
mtcars %>% ggvis(x = ~wt, y = ~mpg, fill = ~cyl) %>%
  layer_points() %>%
  hide_legend("fill")

# Combining two properties in one legend
mtcars %>%
  ggvis(x = ~wt, y = ~mpg, fill = ~factor(cyl), shape = ~factor(cyl)) %>%
  layer_points() %>%
  add_legend(c("fill", "shape"))

# Control legend properties with a continuous legend, with x and y position
# in pixels.
mtcars %>% ggvis(x = ~wt, y = ~mpg, fill = ~cyl) %>%
  layer_points() %>%
  add_legend("fill", title = "Cylinders",
    properties = legend_props(
      title = list(fontSize = 16),
      labels = list(fontSize = 12, fill = "#00F"),
      gradient = list(stroke = "red", strokeWidth = 2),
      legend = list(x = 500, y = 50)
    )
  )

# Control legend properties with a categorical legend, with x and y position
# in the scaled data space.
mtcars %>% ggvis(x = ~wt, y = ~mpg, fill = ~factor(cyl)) %>%
  layer_points() %>%
  add_legend("fill", title = "Cylinders",
    properties = legend_props(
      title = list(fontSize = 16),
      labels = list(fontSize = 14, dx = 5),
      symbol = list(stroke = "black", strokeWidth = 2,
        shape = "square", size = 200),
      legend = list(
        x = scaled_value("x", 4.5),
        y = scaled_value("y", 30)
      )
    )
  )

# Control legend position using x_rel and y_rel which specify relative
# position, going from 0 to 1. (0, 0) is the bottom-left corner, and
# (1, 1) is the upper-right corner. The values control the position of
# the upper-left corner of the legend.
mtcars %>% ggvis(x = ~wt, y = ~mpg, fill = ~cyl) %>%
  layer_points() %>%
  add_relative_scales() %>%
  add_legend("fill", title = "Cylinders",
    properties = legend_props(
      legend = list(
        x = scaled_value("x_rel", 0.8),
        y = scaled_value("y_rel", 1)
      )
    )
  )



