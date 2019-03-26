library(ijtiff)


### Name: read_tags
### Title: Read TIFF tag information without actually reading the image
###   array.
### Aliases: read_tags

### ** Examples

read_tags(system.file("img", "Rlogo.tif", package="ijtiff"))
read_tags(system.file("img", "2ch_ij.tif", package="ijtiff"))
read_tags(system.file("img", "2ch_ij.tif", package="ijtiff"), all = c(2, 4))




