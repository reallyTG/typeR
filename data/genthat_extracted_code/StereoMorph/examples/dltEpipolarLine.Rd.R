library(StereoMorph)


### Name: dltEpipolarLine
### Title: Finds a epipolar or self-epipolar line
### Aliases: dltEpipolarLine
### Keywords: DLT epipolar functions

### ** Examples

## FIND THE FILE DIRECTORY FOR EXTRA R PACKAGE FILES
fdir <- paste0(path.package("StereoMorph"), "/extdata/")

## SET FILE PATH TO CALIBRATION COEFFICIENTS IN TWO CAMERA STEREO SETUP
cc_file <- paste0(fdir, "cal_coeffs.txt")

## LOAD COEFFICIENTS
cal.coeff <- as.matrix(read.table(file=cc_file))

## GET LANDMARKS IN FIRST CAMERA VIEW
lm_file <- paste0(fdir, "lm_2d_a1_v1.txt")

## READ LANDMARKS INTO MATRIX
lm.matrix <- readLandmarksToMatrix(file=lm_file, row.names=1)

## FIND EPIPOLAR LINE IN SECOND CAMERA VIEW
epipolar <- dltEpipolarLine(p=lm.matrix['occipital_condyle', ], cal.coeff1=cal.coeff)

## FIND SELF-EPIPOLAR LINE (IN FIRST CAMERA VIEW)
self_epipolar <- dltEpipolarLine(p=lm.matrix['occipital_condyle', ], cal.coeff1=cal.coeff, 
  self=TRUE)

## CONFIRM THAT DISTANCE FROM ORIGINAL POINT TO SELF-EPIPOLAR LINE IS ZERO
distancePointToLine(p=lm.matrix['occipital_condyle', ], l1=self_epipolar)



