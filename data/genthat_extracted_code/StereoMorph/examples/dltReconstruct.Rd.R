library(StereoMorph)


### Name: dltReconstruct
### Title: Reconstructs the 3D position of points in two or more camera
###   views
### Aliases: dltReconstruct summary.dltReconstruct
###   print.summary.dltReconstruct
### Keywords: DLT

### ** Examples

## GET THE FILE DIRECTORY FOR EXTRA R PACKAGE FILES
fdir <- paste0(path.package("StereoMorph"), "/extdata/")

## SET FILE PATH TO CALIBRATION COEFFICIENTS IN TWO CAMERA STEREO SETUP
cc_file <- paste0(fdir, "cal_coeffs.txt")

## LOAD COEFFICIENTS
cal.coeff <- as.matrix(read.table(file=cc_file))

## GET LANDMARKS IN FIRST CAMERA VIEW
lm_files <- paste0(fdir, c("lm_2d_a1_v1.txt", "lm_2d_a1_v2.txt"))

## READ LANDMARKS INTO MATRIX
lm.matrix <- readLandmarksToMatrix(file=lm_files, row.names=1)

## RECONSTRUCT LANDMARKS IN 3D (MATRIX INPUT)
dlt_recon <- dltReconstruct(cal.coeff=cal.coeff, coor.2d=lm.matrix)


## OTHER POSSIBLE LANDMARK FORMAT INPUTS ##
## READ LANDMARKS INTO LIST
lm.list <- readLandmarksToList(file=lm_files, row.names=1)

## RECONSTRUCT LANDMARKS IN 3D (LIST INPUT)
dlt_recon <- dltReconstruct(cal.coeff=cal.coeff, coor.2d=lm.list)

## READ LANDMARKS INTO ARRAY
lm.array <- readLandmarksToArray(file=lm_files, row.names=1)

## RECONSTRUCT LANDMARKS IN 3D (ARRAY INPUT)
dlt_recon <- dltReconstruct(cal.coeff=cal.coeff, coor.2d=lm.array)



