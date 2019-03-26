library(StereoMorph)


### Name: dltNearestPointOnEpipolar
### Title: Returns the closest point on a epipolar line to a point or
###   points
### Aliases: dltNearestPointOnEpipolar
### Keywords: DLT epipolar functions

### ** Examples

## FIND THE FILE DIRECTORY FOR EXTRA R PACKAGE FILES
fdir <- paste0(path.package("StereoMorph"), "/extdata/")

## SET FILE PATH TO CALIBRATION COEFFICIENTS IN TWO CAMERA STEREO SETUP
cc_file <- paste0(fdir, "cal_coeffs.txt")

## LOAD COEFFICIENTS
cal.coeff <- as.matrix(read.table(file=cc_file))

## GET LANDMARKS IN FIRST CAMERA VIEW
lm_files <- paste0(fdir, c("lm_2d_a1_v1.txt", "lm_2d_a1_v2.txt"))

## READ LANDMARKS INTO MATRIX
lm.array <- readLandmarksToArray(file=lm_files, row.names=1)

## FIND THE NEAREST POINT ON THE EPIPOLAR LINE OF P1
dltNearestPointOnEpipolar(p1=lm.array[3, , 1], p2=lm.array[3, , 2], cal.coeff=cal.coeff)

## FIND THE NEAREST POINT ON THE EPIPOLAR LINE OF P1
## THIS TIME USING ALL LANDMARKS IN THAT VIEW
## FUNCTION IDENTIFIES THE CORRECT LANDMARK IN THE SECOND VIEW AS THE SAME LANDMARK
dltNearestPointOnEpipolar(p1=lm.array[3, , 1], p2=lm.array[, , 2], cal.coeff=cal.coeff)




