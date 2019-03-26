library(rgl)


### Name: rglwidget
### Title: An htmlwidget to hold an rgl scene.
### Aliases: rglwidget rgl.printRglwidget

### ** Examples

save <- getOption("rgl.useNULL")
options(rgl.useNULL=TRUE)
example("plot3d", "rgl")
widget <- rglwidget()
if (interactive())
  widget
  
## No test: 
# Save it to a file.  This requires pandoc
filename <- tempfile(fileext = ".html")
htmlwidgets::saveWidget(rglwidget(), filename)
browseURL(filename)
## End(No test)



