library(StereoMorph)


### Name: dltCoefficients
### Title: Computes DLT coefficients for a stereo camera setup
### Aliases: dltCoefficients summary.dltCoefficients
###   print.summary.dltCoefficients
### Keywords: DLT

### ** Examples

## SET NUMBER OF INTERNAL CORNERS AND ROWS
nx <- 21
ny <- 14

## GET THE FILE DIRECTORY FOR EXTRA R PACKAGE FILES
fdir <- paste0(path.package("StereoMorph"), "/extdata/")

## GET FILE PATHS FOR PIXEL COORDINATES FROM CALIBRATION IMAGES 1 AND 5
file2d <- matrix(c(paste0(fdir, "cal_a", c(1, 5), "_v1.txt"), 
  paste0(fdir, "cal_a", c(1, 5), "_v2.txt")), ncol=2)

## READ INTO ARRAY
## THESE ARE THE 2D COORDINATES USED IN THE CALIBRATION
coor.2d <- readCheckerboardsToArray(file=file2d, nx=nx, ny=ny, col.reverse=TRUE)

## REDUCE ARRAY DIMENSIONS TO THREE
## THIS STACKS MULTIPLE VIEWS ON TOP OF EACH OTHER INTO THE SAME MATRIX
coor.2d <- apply(coor.2d, c(2, 4), matrix, byrow=FALSE)

## GET FILE PATH FOR CORRESPONDING 3D COORDINATES
file3d <- paste0(fdir, "cal_3d_coor.txt")

## READ 3D POINTS INTO MATRIX
coor.3d <- as.matrix(read.table(file=file3d))

## FIND THE DLT COEFFICIENTS
dlt_coeffcients <- dltCoefficients(coor.3d=coor.3d, coor.2d=coor.2d)

## PRINT THE SUMMARY
summary(dlt_coeffcients)

## NOTE THAT EACH CAMERA VIEW IS CALIBRATED SEPARATELY
## GIVES THE EXACT SAME RESULT
dltCoefficients(coor.3d=coor.3d, coor.2d=coor.2d[, , 1])



