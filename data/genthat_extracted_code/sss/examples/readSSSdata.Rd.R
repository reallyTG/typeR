library(sss)


### Name: readSSSdata
### Title: Reads a triple-s XML (asc) data file, as specified by the
###   triple-s XML standard.
### Aliases: readSSSdata
### Keywords: parse

### ** Examples

sampleRoot <- system.file("sampledata", package = "sss")
filenameSSS <- file.path(sampleRoot, "sample-1.sss")
filenameASC <- file.path(sampleRoot, "sample-1.asc")

readSSSdata(filenameSSS)
readSSSmetadata(filenameSSS)



