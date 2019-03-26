library(StereoMorph)


### Name: landmarkListToMatrix
### Title: Converts a landmark list to a landmark matrix
### Aliases: landmarkListToMatrix

### ** Examples

## GET FILE DIRECTORY FOR PACKAGE FILES
fdir <- paste0(path.package("StereoMorph"), "/extdata/")

## SET FILES TO LOAD - TWO DIFFERENT 3D POINT SETS
file <- paste0(fdir, "lm_3d_even_a", 1:2, ".txt")

## READ LANDMARKS INTO A LIST
lm.list <- readLandmarksToList(file=file, row.names=1)

## CONVERT LANDMARK LIST TO LANDMARK MATRIX
lm.matrix <- landmarkListToMatrix(lm.list)

lm.matrix



