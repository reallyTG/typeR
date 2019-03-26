library(rphast)


### Name: print.tm
### Title: Printing Tree Models
### Aliases: print.tm
### Keywords: tm

### ** Examples

exampleArchive <- system.file("extdata", "examples.zip", package="rphast")
filename <- "rev.mod"
unzip(exampleArchive, filename)
tm <- read.tm(filename)
tm
print(tm, aslist=TRUE)
unlink(filename)



