library(rphast)


### Name: write.tm
### Title: Wrting Tree Models
### Aliases: write.tm
### Keywords: tm

### ** Examples

exampleArchive <- system.file("extdata", "examples.zip", package="rphast")
filename <- "rev.mod"
unzip(exampleArchive, filename)
tm <- read.tm(filename)
tm
write.tm(tm, NULL)
write.tm(tm, "test.mod")
unlink(c(filename, "test.mod"))



