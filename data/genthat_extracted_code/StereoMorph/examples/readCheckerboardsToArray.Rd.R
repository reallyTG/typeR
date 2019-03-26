library(StereoMorph)


### Name: readCheckerboardsToArray
### Title: Reads file(s) containing grid points into an array
### Aliases: readCheckerboardsToArray
### Keywords: read functions

### ** Examples

## GET FILE DIRECTORY FOR PACKAGE FILES
fdir <- paste0(path.package("StereoMorph"), "/extdata/")

## SET NUMBER OF ROWS AND COLUMNS
## THESE ARE THE NUMBER OF INTERNAL CORNERS, NOT THE NUMBER OF SQUARES
nx <- 4
ny <- 3

## SET FILE PATHS
file <- matrix(c(paste0(fdir, "rcta_a", 1:3, "_v1.txt"), 
                 paste0(fdir, "rcta_a", 1:3, "_v2.txt")), ncol=2)

## READ MATRIX OF FILES ##
## REVERSE COLUMNS IN FIRST COLUMN OF FILE MATRIX
## REVERSE ROWS IN ALL FILES
readCheckerboardsToArray(file, nx, ny, col.reverse=c(TRUE, FALSE), row.reverse=TRUE)



