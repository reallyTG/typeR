library(rphast)


### Name: summary.tm
### Title: Tree Model Summary
### Aliases: summary.tm
### Keywords: tm

### ** Examples

exampleArchive <- system.file("extdata", "examples.zip", package="rphast")
filename <- "rev.mod"
unzip(exampleArchive, filename)
read.tm(filename)
unlink(c(filename, "test.mod"))



