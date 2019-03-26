library(rbokeh)


### Name: ly_points
### Title: Add a "points" layer to a Bokeh figure
### Aliases: ly_points

### ** Examples

## No test: 
figure() %>%
  ly_points(Sepal.Length, Sepal.Width, data = iris,
    color = Species, glyph = Species,
    hover = list(Sepal.Length, Sepal.Width))

# custom hover
mtcars$model <- row.names(mtcars)
figure() %>%
  ly_points(disp, mpg, data = mtcars, color = cyl,
    hover = "This <strong>@model</strong><br>has @hp horsepower!")
## End(No test)
## No test: 
z <- lm(dist ~ speed, data = cars)
p <- figure() %>%
  ly_points(cars, hover = cars) %>%
  ly_lines(lowess(cars), legend = "lowess") %>%
  ly_abline(z, type = 2, legend = "lm", width = 2)
p
## End(No test)



