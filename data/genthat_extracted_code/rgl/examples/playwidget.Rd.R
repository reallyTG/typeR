library(rgl)


### Name: playwidget
### Title: Add a widget to play animations.
### Aliases: playwidget

### ** Examples

saveopts <- options(rgl.useNULL = TRUE)

objid <- plot3d(1:10, 1:10, rnorm(10), col=c("red", "red"), type = "s")["data"]

control <- ageControl(value=0,
             births=1:10,
             ages = c(-5,0,5),
             colors = c("green", "yellow", "red"),
             objids = objid)

## No test: 
# This example uses explicit names
rglwidget(elementId = "theplot", controllers = "theplayer",
          height = 300, width = 300)
playwidget("theplot", control, start = -5, stop = 5,
           rate = 3, elementId = "theplayer",
           components = c("Play", "Slider"))
## End(No test)

# This example uses pipes, and can skip the names

widget <- rglwidget(height = 300, width = 300) %>%
playwidget(control, start = -5, stop = 5,
           rate = 3, components = c("Play", "Slider"))
if (interactive())
  widget

options(saveopts)



