library(RImageJROI)


### Name: read.ijzip
### Title: Read ImageJ zip file containing several ROI files
### Aliases: read.ijzip

### ** Examples

file <- file.path(system.file(package = "RImageJROI"), "extdata", "ijroi", "ijzip.zip")
x <- read.ijzip(file)
plot(x)



