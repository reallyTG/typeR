library(StereoMorph)


### Name: dltCalibrateCameras
### Title: Finds the optimized DLT coefficients for a stereo camera setup
### Aliases: dltCalibrateCameras summary.dltCalibrateCameras
###   print.summary.dltCalibrateCameras
### Keywords: DLT calibration

### ** Examples

## SET NUMBER OF INTERNAL CORNERS FOR CALIBRATION GRIDS
nx <- 21
ny <- 14

## GET THE FILE DIRECTORY FOR EXTRA R PACKAGE FILES
fdir <- paste0(path.package("StereoMorph"), "/extdata/")

## SET FILE PATH TO CHECKERBOARD CORNERS FROM CALIBRATION IMAGE SET
## THE TUTORIAL INCLUDES 8 CALIBRATION IMAGES FROM TWO CAMERA VIEWS
file <- matrix(c(paste0(fdir, "cal_a", 1:8, "_v1.txt"), 
  paste0(fdir, "cal_a", 1:8, "_v2.txt")), ncol=2)

## READ IN CHECKERBOARD CORNERS
## NOTE THAT col.reverse IS USED TO MAKE POINTS CORRESPOND
coor.2d <- readCheckerboardsToArray(file=file, nx=nx, ny=ny, col.reverse=TRUE)

## SET GRID SIZE (IN MM)
grid.size <- 6.347889

## Not run: 
##D ## CALIBRATE CAMERAS
##D ## TO REDUCE RUN-TIME, WE JUST USE CORNERS FROM TWO IMAGES (1 AND 5)
##D dlt_calibrate_cameras <- dltCalibrateCameras(coor.2d=coor.2d[, , c(1, 5), ], nx=nx, 
##D   grid.size=grid.size, c.run=FALSE, print.progress=TRUE)
##D 
##D ## RUN CALIBRATION ON ALL IMAGES, ACCURACY IS GREATLY IMPROVED
##D dlt_calibrate_cameras <- dltCalibrateCameras(coor.2d=coor.2d, nx=nx, 
##D   grid.size=grid.size, c.run=FALSE, print.progress=TRUE)
##D 
##D ## PRINT SUMMARY
##D summary(dlt_calibrate_cameras)
## End(Not run)



