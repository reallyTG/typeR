library(rlas)


### Name: read.las
### Title: Read data from a .las or .laz file
### Aliases: read.las

### ** Examples

lazfile <- system.file("extdata", "example.laz", package="rlas")

lasdata <- read.las(lazfile)
lasdata <- read.las(lazfile, filter = "-keep_first")
lasdata <- read.las(lazfile, filter = "-drop_intensity_below 80")
lasdata <- read.las(lazfile, select = "xyzia")



