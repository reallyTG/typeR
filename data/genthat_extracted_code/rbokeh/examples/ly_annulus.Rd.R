library(rbokeh)


### Name: ly_annulus
### Title: Add an "annulus" layer to a Bokeh figure
### Aliases: ly_annulus

### ** Examples

rescale <- function(x)
  (x - min(x)) / diff(range(x))
figure() %>%
  ly_annulus(Sepal.Length, Sepal.Width, data = iris,
    color = Species, hover = Species, alpha = 0.5,
    outer_radius = rescale(Petal.Length) * 0.3,
    inner_radius = rescale(Petal.Length) * 0.1)



