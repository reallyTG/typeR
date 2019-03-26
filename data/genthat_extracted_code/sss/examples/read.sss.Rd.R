library(sss)


### Name: read.sss
### Title: Reads a triple-s XML (asc) data file, as specified by the
###   triple-s XML standard.
### Aliases: read.sss
### Keywords: read

### ** Examples

sampleRoot <- system.file("sampledata", package = "sss")
filenameSSS <- file.path(sampleRoot, "sample-1.sss")

read.sss(filenameSSS)



