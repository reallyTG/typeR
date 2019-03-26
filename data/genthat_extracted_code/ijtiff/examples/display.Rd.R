library(ijtiff)


### Name: display
### Title: Basic image display.
### Aliases: display

### ** Examples

img <- read_tif(system.file("img", "Rlogo.tif", package = "ijtiff"))
display(img)
display(img[, , 1, 1])  # first (red) channel, first frame
display(img[, , 2, ])  # second (green) channel, first frame
display(img[, , 3, ])  # third (blue) channel, first frame
display(img, basic = TRUE)  # displays first (red) channel, first frame




