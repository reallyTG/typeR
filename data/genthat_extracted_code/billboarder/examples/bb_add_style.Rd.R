library(billboarder)


### Name: bb_add_style
### Title: Add custom style for regions and grid lines
### Aliases: bb_add_style

### ** Examples

# Change default color for regions
billboarder() %>% 
  bb_linechart(data = sin(seq(-pi, pi, length.out = 30))) %>% 
  bb_regions(
    list(start = 0, end = 10, class = "custom"), # add custom class
    list(start = 19, end = 29, class = "foo")
  ) %>% 
  bb_add_style(region = list(custom = "fill: red;", foo = "fill: #009246;"))

# Customize grid line and text
billboarder() %>% 
  bb_linechart(data = sin(seq(-pi, pi, length.out = 30))) %>% 
  bb_y_grid(lines = list(list(
    value = 0, text = "Zero", position  = "middle", class = "zero"
  ))) %>% 
  bb_add_style(y_grid = list(
    zero = list(line = "stroke: red", text = "font-size: 240%; fill: black"
  )))




