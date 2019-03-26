library(rtiff)


### Name: getDescription
### Title: Get the description on a TIFF file.
### Aliases: getDescription
### Keywords: utilities IO file

### ** Examples

# This has no description
getDescription(system.file("tiff", "jello.tif", package="rtiff"))
# but this has
getDescription(system.file("tiff", "t1.tif", package="rtiff"))



