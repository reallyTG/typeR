library(traitr)


### Name: imageItem
### Title: Display an image specified by its filename.
### Aliases: imageItem

### ** Examples

img <- system.file("images/plot.gif", package="gWidgets")   ## some image
i <- imageItem(img)                                         ## constructor
## Not run: i$make_ui(container=gwindow("Image"))                       ## show item directly



