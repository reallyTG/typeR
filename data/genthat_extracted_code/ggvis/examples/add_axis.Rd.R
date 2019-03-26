library(ggvis)


### Name: add_axis
### Title: Add a vega axis specification to a ggvis plot
### Aliases: add_axis hide_axis

### ** Examples

mtcars %>% ggvis(x = ~wt, y = ~mpg, fill = ~cyl) %>%
  layer_points() %>%
  add_axis("x", title = "Weight", orient = "top")

# Suppress axis with hide_axis
mtcars %>% ggvis(x = ~wt, y = ~mpg, fill = ~cyl) %>%
  layer_points() %>%
  hide_axis("x") %>% hide_axis("y")

mtcars %>% ggvis(x = ~wt, y = ~mpg) %>% layer_points() %>%
  add_axis("x", title = "Weight", ticks = 40,
    properties = axis_props(
      ticks = list(stroke = "red"),
      majorTicks = list(strokeWidth = 2),
      grid = list(stroke = "red"),
      labels = list(
        fill = "steelblue",
        angle = 50,
        fontSize = 14,
        align = "left",
        baseline = "middle",
        dx = 3
      ),
      title = list(fontSize = 16),
      axis = list(stroke = "#333", strokeWidth = 1.5)
    )
  )



