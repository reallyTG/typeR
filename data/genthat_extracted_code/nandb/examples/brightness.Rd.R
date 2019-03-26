library(nandb)


### Name: brightness
### Title: Calculate brightness from image series.
### Aliases: brightness

### ** Examples

img <- ijtiff::read_tif(system.file('extdata', '50.tif', package = 'nandb'))
ijtiff::display(img[, , 1, 1])
b <- brightness(img, "e", thresh = "Huang")
b <- brightness(img, "B", thresh = "tri")



