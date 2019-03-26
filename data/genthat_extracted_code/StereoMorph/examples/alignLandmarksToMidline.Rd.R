library(StereoMorph)


### Name: alignLandmarksToMidline
### Title: Aligns bilateral landmarks to the midline plane
### Aliases: alignLandmarksToMidline summary.alignLandmarksToMidline
###   print.summary.alignLandmarksToMidline

### ** Examples

## FIND THE FILE DIRECTORY FOR EXTRA R PACKAGE FILES
fdir <- paste0(path.package("StereoMorph"), "/extdata/")

## GET LANDMARKS
file <- paste0(fdir, "lm_3d_unify.txt")

## LOAD FILES INTO A MATRIX
lm.matrix <- readLandmarksToMatrix(file=file, row.names=1)

## ALIGN TO MIDLINE
align_landmarks <- alignLandmarksToMidline(lm.matrix=lm.matrix)

## PRINT SUMMARY OF ERRORS
print(summary(align_landmarks))



