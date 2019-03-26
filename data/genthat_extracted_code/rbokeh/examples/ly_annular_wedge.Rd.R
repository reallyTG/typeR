library(rbokeh)


### Name: ly_annular_wedge
### Title: Add an "annular_wedge" layer to a Bokeh figure
### Aliases: ly_annular_wedge

### ** Examples

rescale <- function(x)
  (x - min(x)) / diff(range(x))
figure() %>%
  ly_annular_wedge(Sepal.Length, Sepal.Width, data = iris,
    end_angle = rescale(Petal.Length) * 2 * pi, color = Species,
    inner_radius = 0.1, outer_radius = 0.15, alpha = 0.5,
    hover = Species)



