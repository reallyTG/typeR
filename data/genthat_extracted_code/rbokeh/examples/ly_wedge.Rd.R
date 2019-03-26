library(rbokeh)


### Name: ly_wedge
### Title: Add a "wedge" layer to a Bokeh figure
### Aliases: ly_wedge

### ** Examples

rescale <- function(x)
  (x - min(x)) / diff(range(x))
figure() %>%
  ly_wedge(Sepal.Length, Sepal.Width, data = iris,
    end_angle = rescale(Petal.Length) * 2 * pi, color = Species,
    radius = 0.15, alpha = 0.5,
    hover = Species)



