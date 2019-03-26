library(StereoMorph)


### Name: dltTestCalibration
### Title: Tests the accuracy of a stereo camera calibration
### Aliases: dltTestCalibration summary.dltTestCalibration
###   print.summary.dltTestCalibration
### Keywords: DLT calibration

### ** Examples

## SET NUMBER OF INTERNAL ROWS AND COLUMNS
nx <- 21
ny <- 14

## GET THE FILE DIRECTORY FOR EXTRA R PACKAGE FILES
fdir <- paste0(path.package("StereoMorph"), "/extdata/")

## SET FILE PATH TO CHECKERBOARD CORNERS FROM TEST CALIBRATION IMAGE SET
file <- matrix(c(paste0(fdir, "test_cal_a", 1:11, "_v1.txt"), 
  paste0(fdir, "test_cal_a", 1:11, "_v2.txt")), ncol=2)

## READ IN CHECKERBOARD CORNERS
coor.2d <- readCheckerboardsToArray(file=file, nx=nx, ny=ny, col.reverse=FALSE)

## SET GRID SIZE OF TEST CHECKERBOARDS (IN MM)
sq.size <- 4.2218

## LOAD CALIBRATION COEFFICIENTS
cal.coeff <- as.matrix(read.table(file=paste0(fdir, "cal_coeffs.txt")))

## TEST CALIBRATION ACCURACY
## USE ONLY A SUBSET (FIVE) OF TEST CALIBRATION IMAGES
## IN THE TUTORIAL POINTS, UNITS NOT IN PIXELS ARE MILLIMETERS
dlt_test <- dltTestCalibration(cal.coeff=cal.coeff, coor.2d=coor.2d[, , 1:5, ], nx=nx, 
  sq.size=sq.size)

## RUN TEST ON ALL TEST CALIBRATION IMAGES
## Not run: 
##D dlt_test <- dltTestCalibration(cal.coeff=cal.coeff, coor.2d=coor.2d, nx=nx, 
##D   sq.size=sq.size)
## End(Not run)

## PRINT SUMMARY
summary(dlt_test)

## PLOT A HISTOGRAM OF THE INTERPOINT DISTANCE ERROR
hist(dlt_test$ipd.error)

## PLOT ADJACENT POINT DISTANCE ERROR AS A FUNCTION OF POSITION ALONG THE Y-AXIS
dev.new()
plot(dlt_test$adj.pair.ipd.error, abs(dlt_test$adj.pair.mean.pos[, 2, ]))

## PLOT POSITION-BASED ERROR AS A FUNCTION OF POSITION ALONG THE X-AXIS
dev.new()
plot(dlt_test$aitr.pos[, 1, ], abs(dlt_test$aitr.error[, 1, ]))



