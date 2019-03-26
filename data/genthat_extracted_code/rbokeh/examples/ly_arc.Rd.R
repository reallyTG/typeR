library(rbokeh)


### Name: ly_arc
### Title: Add an "arc" layer to a Bokeh figure
### Aliases: ly_arc

### ** Examples

rescale <- function(x)
  (x - min(x)) / diff(range(x))
figure() %>%
  ly_arc(Sepal.Length, Sepal.Width, data = iris,
    end_angle = rescale(Petal.Length) * 2 * pi, color = Species,
    alpha = 0.5)



