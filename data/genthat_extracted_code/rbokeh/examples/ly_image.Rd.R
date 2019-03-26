library(rbokeh)


### Name: ly_image
### Title: Add an "image" layer to a Bokeh figure
### Aliases: ly_image

### ** Examples

## No test: 
p <- figure(xlim = c(0, 1), ylim = c(0, 1), title = "Volcano") %>%
  ly_image(volcano) %>%
  ly_contour(volcano)
p
## End(No test)



