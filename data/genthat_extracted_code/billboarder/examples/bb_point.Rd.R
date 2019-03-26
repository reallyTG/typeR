library(billboarder)


### Name: bb_point
### Title: Point property for a Billboard.js chart
### Aliases: bb_point

### ** Examples

# Set point size
billboarder() %>% 
  bb_scatterplot(data = iris, x = "Sepal.Length", y = "Sepal.Width", group = "Species") %>% 
  bb_axis(x = list(tick = list(fit = FALSE))) %>% 
  bb_point(r = 10)



