library(showimage)


### Name: show_image
### Title: Show an Image on an R Graphics Device
### Aliases: show_image

### ** Examples

rlogo <- system.file("img", "Rlogo.png", package="png")
show_image(rlogo)

## Create a plot in a PNG and show it
png(tmp <- tempfile(fileext = ".png"))
pairs(iris)
dev.off()
show_image(tmp)



