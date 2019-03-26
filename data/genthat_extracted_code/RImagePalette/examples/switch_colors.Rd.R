library(RImagePalette)


### Name: switch_colors
### Title: Swap Colors in an Image
### Aliases: switch_colors

### ** Examples

#Trivial example of using only 5 dominant colors
# from an image to recolor itself
img1 <- jpeg::readJPEG(system.file("img", "Rlogo.jpg", package="jpeg"))
img2 <- jpeg::readJPEG(system.file("img", "Rlogo.jpg", package="jpeg"))
switch_colors(img1, img2, source_colors=5, smoothness=20)



