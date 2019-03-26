library(StereoMorph)


### Name: dltEpipolarDistance
### Title: Finds the distance between a point and a self-epipolar line
### Aliases: dltEpipolarDistance
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

## FIND EPIPOLAR DISTANCE BETWEEN TWO SINGLE LANDMARKS
## EPIPOLAR DISTANCE (ERROR) IS AROUND 7 PIXELS
## IDENTIFYING THE EXACT SAME POINT IN TWO VIEWS MANUALLY IS CHALLENGING...
dltEpipolarDistance(p1=lm.array[1, , 1], p2=lm.array[1, , 2], cal.coeff=cal.coeff)

## FIND EPIPOLAR DISTANCE USING EPIPOLAR FROM SECOND VIEW INSTEAD
dltEpipolarDistance(p1=lm.array[1, , 2], p2=lm.array[1, , 1], cal.coeff=cal.coeff[, 2:1])

## FIND MEAN RECIPROCAL EPIPOLAR DISTANCE BETWEEN TWO SINGLE LANDMARKS
## THIS IS THE AVERAGE OF THE PREVIOUS TWO DISTANCES
dltEpipolarDistance(p1=lm.array[1, , 1], p2=lm.array[1, , 2], cal.coeff=cal.coeff, 
  reciprocal=TRUE)

## FIND EPIPOLAR DISTANCES BETWEEN ALL LANDMARKS
## PROCEEDS PAIRWISE BECAUSE p1 AND p2 HAVE THE SAME DIMENSIONS
dltEpipolarDistance(p1=lm.array[, , 1], p2=lm.array[, , 2], cal.coeff=cal.coeff)

## FIND EPIPOLAR DISTANCES BETWEEN FIRST LANDMARK AND ALL LANDMARKS
## HERE THE EPIPOLAR DISTANCES ARE HIGH BECAUSE ONLY THE FIRST LANDMARK
##  CORRESPONDS
## THE REMAINING POINTS ARE NOT THE SAME LANDMARK
dltEpipolarDistance(p1=lm.array[1, , 1], p2=lm.array[, , 2], cal.coeff=cal.coeff)




