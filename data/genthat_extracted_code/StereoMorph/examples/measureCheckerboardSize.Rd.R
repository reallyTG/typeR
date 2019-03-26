library(StereoMorph)


### Name: measureCheckerboardSize
### Title: Estimates checkerboard square size
### Aliases: measureCheckerboardSize summary.measureCheckerboardSize
###   print.summary.measureCheckerboardSize
### Keywords: grid functions calibration

### ** Examples

## GET THE FILE DIRECTORY FOR EXTRA R PACKAGE FILES
fdir <- paste0(path.package("StereoMorph"), "/extdata/")

## SET FILE PATH TO CHECKERBOARD POINTS FILE
corner_file <- paste0(fdir, "checker_21_14_200(9).txt")

## NUMBER OF INTERNAL CORNERS IN THE HORIZONTAL DIMENSION
nx <- 21

## NUMBER OF INTERNAL CORNERS IN THE VERTICAL DIMENSION
ny <- 14

## SET FILE PATH TO RULER POINTS FILE
ruler_file <- paste0(fdir, "ruler_21_14_200(9).txt")

## ESTIMATE SQUARE SIZE
square_size <- measureCheckerboardSize(corner.file=corner_file, nx=nx)

## PRINT SUMMARY
summary(square_size)



## ESTIMATE SQUARE SIZE AND SCALE WITH RULER POINTS
square_size_scale <- measureCheckerboardSize(corner.file=corner_file, nx=nx,
    ruler.file=ruler_file, ruler.pt.size='1 mm')

## PRINT SUMMARY
summary(square_size_scale)


## Not run: 
##D 
##D ## INPUT MATRICES DIRECTLY
##D ## READ POINTS INTO MATRICES
##D corner_pts <- as.matrix(read.table(corner_file))
##D ruler_pts <- as.matrix(read.table(ruler_file, row.names=1))
##D 
##D ## ESTIMATE SQUARE SIZE AND SCALE WITH RULER POINTS
##D square_size_scale <- measureCheckerboardSize(corner.file=corner_pts, nx=nx,
##D     ruler.file=ruler_pts, ruler.pt.size='1 mm')
## End(Not run)



