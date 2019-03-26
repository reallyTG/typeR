library(ggvis)


### Name: scales
### Title: Add a scale to a ggvis plot
### Aliases: scales set_default_scale set_dscale

### ** Examples

p <- mtcars %>%
  ggvis(x = ~wt, y = ~mpg, fill = ~factor(cyl), stroke = ~hp) %>%
  layer_points()

p %>% scale_numeric("x")
p %>% scale_numeric("stroke")
p %>% scale_nominal("fill")

# You can also supply additional arguments or override the defaults
p %>% scale_numeric("x", trans = "log")
p %>% scale_numeric("stroke", range = c("red", "blue"))



