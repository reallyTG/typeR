library(StereoMorph)


### Name: unifyLandmarks
### Title: Optimally align a set of partial landmark sets
### Aliases: unifyLandmarks summary.unifyLandmarks
###   print.summary.unifyLandmarks
### Keywords: landmark alignment

### ** Examples

## FIND THE FILE DIRECTORY FOR EXTRA R PACKAGE FILES
fdir <- paste0(path.package("StereoMorph"), "/extdata/")

## SET LANDMARK FILES
file <- paste0(fdir, "lm_3d_even_a", 1:3, ".txt")

## READ LANDMARKS INTO ARRAY
lm.array <- readLandmarksToArray(file, row.names=1)

## UNIFY LANDMARKS
unify_lm <- unifyLandmarks(lm.array)

## PRINT UNIFICATION SUMMARY
print(summary(unify_lm))



