library(StereoMorph)


### Name: readLandmarksToMatrix
### Title: Reads a landmark file or files into a matrix
### Aliases: readLandmarksToMatrix
### Keywords: landmarks read functions

### ** Examples

## GET FILE DIRECTORY FOR PACKAGE FILES
fdir <- paste0(path.package("StereoMorph"), "/extdata/")

## SET FILES TO LOAD
file <- paste0(fdir, "lm_2d_a3_v", 1:2, "_wna.txt")

## LOAD FILES INTO A MATRIX
readLandmarksToMatrix(file=file, row.names=1)

## LOAD FILES INTO A MATRIX OMITTING NAS
readLandmarksToMatrix(file=file, row.names=1, na.omit=TRUE)



