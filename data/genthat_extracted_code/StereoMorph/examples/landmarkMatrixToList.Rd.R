library(StereoMorph)


### Name: landmarkMatrixToList
### Title: Converts a landmark matrix to a landmark list
### Aliases: landmarkMatrixToList

### ** Examples


## GET FILE DIRECTORY FOR PACKAGE FILES
fdir <- paste0(path.package("StereoMorph"), "/extdata/")

## SET FILES TO LOAD - TWO DIFFERENT 3D POINT SETS
file <- paste0(fdir, "lm_2d_a1_v", 1:2, ".txt")

## READ LANDMARKS INTO A LIST
lm.matrix <- readLandmarksToMatrix(file=file, row.names=1)

## CONVERT LANDMARK LIST TO LANDMARK MATRIX
lm.list <- landmarkMatrixToList(lm.matrix, k=2)

## CAN BE CONVERTED BACK INTO MATRIX
## RECOVERING THE SAME MATRIX AS THE ORIGINAL
lm.matrix <- landmarkListToMatrix(lm.list)



