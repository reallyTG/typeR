library(StereoMorph)


### Name: dltInverse
### Title: Returns ideal pixel coordinates of 3D point(s) in a stereo
###   camera setup
### Aliases: dltInverse
### Keywords: DLT

### ** Examples

## GET THE FILE DIRECTORY FOR EXTRA R PACKAGE FILES
fdir <- paste0(path.package("StereoMorph"), "/extdata/")

## SET FILE PATH TO CALIBRATION COEFFICIENTS IN TWO CAMERA STEREO SETUP
cc_file <- paste0(fdir, "cal_coeffs.txt")

## LOAD COEFFICIENTS
cal.coeff <- as.matrix(read.table(file=cc_file))

## READ LANDMARKS INTO MATRIX
lm.matrix <- readLandmarksToMatrix(file=paste0(fdir, "lm_3d_a1.txt"), row.names=1)

## GET IDEAL 2D COORDINATES OF 3D POINTS IN FIRST CAMERA VIEW
dltInverse(cal.coeff[, 1], lm.matrix)

## GET IDEAL 2D COORDINATES OF 3D POINTS IN SECOND CAMERA VIEW
dltInverse(cal.coeff[, 2], lm.matrix)



