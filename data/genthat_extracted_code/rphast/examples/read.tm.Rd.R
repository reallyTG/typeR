library(rphast)


### Name: read.tm
### Title: Read a Tree Model
### Aliases: read.tm
### Keywords: tm

### ** Examples

exampleArchive <- system.file("extdata", "examples.zip", package="rphast")
filename <- "rev.mod"
unzip(exampleArchive, filename)
tm <- read.tm(filename)
tm
unlink(filename)



