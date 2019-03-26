library(StereoMorph)


### Name: readLandmarksToList
### Title: Reads landmark file(s) into a list
### Aliases: readLandmarksToList
### Keywords: landmarks read functions

### ** Examples

## GET FILE DIRECTORY FOR PACKAGE FILES
fdir <- paste0(path.package("StereoMorph"), "/extdata/")

## SET FILES TO LOAD - TWO DIFFERENT 3D POINT SETS
file <- paste0(fdir, "lm_3d_even_a", 1:2, ".txt")

## READ LANDMARKS INTO A LIST
lm.list <- readLandmarksToList(file=file, row.names=1)

## CURVE POINTS
## CURVE POINTS ARE ABSENT FROM FIRST POINT SET
lm.list[['tomium_R']]

## LANDMARKS PRESENT IN BOTH POINT SETS
lm.list[['quadrate_jugal_R']]

## LANDMARK MISSING FROM SECOND POINT SET
lm.list[['foramen_magnum_inf']]



