library(RImagePalette)


### Name: image_pal
### Title: Image palette
### Aliases: image_pal

### ** Examples

img <- jpeg::readJPEG(system.file("img", "Rlogo.jpg", package="jpeg"))
display_image(img)
scales::show_col(image_pal(img)(10))



