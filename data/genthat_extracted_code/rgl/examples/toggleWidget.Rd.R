library(rgl)


### Name: toggleWidget
### Title: An HTML widget to toggle display of elements of a scene.
### Aliases: toggleWidget

### ** Examples

theplot <- plot3d(rnorm(100), rnorm(100), rnorm(100), col = "red")
widget <- rglwidget(height = 300, width = 300) %>%
  toggleWidget(theplot["data"], label = "Points")
if (interactive())
  widget



