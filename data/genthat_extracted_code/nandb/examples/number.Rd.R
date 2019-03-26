library(nandb)


### Name: number
### Title: Calculate number from image series.
### Aliases: number

### ** Examples

img <- ijtiff::read_tif(system.file('extdata', '50.tif', package = 'nandb'))
ijtiff::display(img[, , 1, 1])
num <- number(img, "N", thresh = "Huang")
num <- number(img, "n", thresh = "tri")



