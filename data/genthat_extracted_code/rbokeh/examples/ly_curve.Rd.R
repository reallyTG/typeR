library(rbokeh)


### Name: ly_curve
### Title: Add a "curve" layer to a Bokeh figure
### Aliases: ly_curve

### ** Examples

## No test: 
chippy <- function(x) sin(cos(x)*exp(-x/2))
figure(width = 800) %>%
  ly_curve(chippy, -8, 7, n = 2001)
## End(No test)



