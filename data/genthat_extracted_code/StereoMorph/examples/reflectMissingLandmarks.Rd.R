library(StereoMorph)


### Name: reflectMissingLandmarks
### Title: Reflects missing landmarks across the plane of symmetry
### Aliases: reflectMissingLandmarks summary.reflectMissingLandmarks
###   print.summary.reflectMissingLandmarks

### ** Examples

## FIND THE FILE DIRECTORY FOR EXTRA R PACKAGE FILES
fdir <- paste0(path.package("StereoMorph"), "/extdata/")

## GET LANDMARKS
file <- paste0(fdir, "lm_3d_unify.txt")

## LOAD FILES INTO A MATRIX
lm.matrix <- readLandmarksToMatrix(file=file, row.names=1)

## ALIGN TO MIDLINE
reflect_missing <- reflectMissingLandmarks(lm.matrix=lm.matrix, average=TRUE)

## PRINT SUMMARY OF ERRORS
print(summary(reflect_missing))



