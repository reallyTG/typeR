library(edfReader)


### Name: readEdfHeader
### Title: Read EDF(+) or BDF(+) file header
### Aliases: readEdfHeader readBdfHeader

### ** Examples

# Examples from the vignette
libDir <- system.file ("extdata", package="edfReader")
# a continuous recording
CFile <- paste (libDir, '/edfPlusC.edf', sep='')
CHdr  <- readEdfHeader (CFile)
CHdr                   # print the header
summary (CHdr)         # print a header summary
str (CHdr)             # look to the details
CHdr$sHeaders          # print the signal headers
summary(CHdr$sHeaders) # print a signal headers summary
str(CHdr$sHeaders)     # look to the signal header details
# for a discontinuous recording
DFile <- paste (libDir, '/bdfPlusD.bdf', sep='')
# and proceed as above to read the header and to show the results



