library(rbokeh)


### Name: ly_contour
### Title: Add a "contour" layer to a Bokeh figure
### Aliases: ly_contour

### ** Examples

## No test: 
p <- figure(xlim = c(0, 1), ylim = c(0, 1), title = "Volcano") %>%
  ly_image(volcano) %>%
  ly_contour(volcano)
p
## End(No test)



