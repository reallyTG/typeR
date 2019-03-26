library(rbokeh)


### Name: ly_lines
### Title: Add a "lines" layer to a Bokeh figure Draws lines with the given
###   coordinates.
### Aliases: ly_lines

### ** Examples

## No test: 
z <- lm(dist ~ speed, data = cars)
p <- figure() %>%
  ly_points(cars, hover = cars) %>%
  ly_lines(lowess(cars), legend = "lowess") %>%
  ly_abline(z, type = 2, legend = "lm", width = 2)
p
## End(No test)



