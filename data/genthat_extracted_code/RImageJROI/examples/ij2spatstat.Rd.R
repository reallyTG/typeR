library(RImageJROI)


### Name: ij2spatstat
### Title: Convert 'ijroi' and 'ijzip' objects to spatstat spatial patterns
### Aliases: ij2spatstat

### ** Examples

file <- file.path(system.file(package = "RImageJROI"), "extdata", "ijroi", "ijzip.zip")
x <- read.ijzip(file)
ij2spatstat(x)



