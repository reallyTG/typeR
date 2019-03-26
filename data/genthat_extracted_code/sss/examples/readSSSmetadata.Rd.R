library(sss)


### Name: readSSSmetadata
### Title: Reads a triple-s XML (sss) metadata file, as specified by the
###   triple-s XML standard.
### Aliases: readSSSmetadata
### Keywords: read

### ** Examples

sampleRoot <- system.file("sampledata", package = "sss")
filenameSSS <- file.path(sampleRoot, "sample-1.sss")
filenameASC <- file.path(sampleRoot, "sample-1.asc")

readSSSdata(filenameSSS)
readSSSmetadata(filenameSSS)



