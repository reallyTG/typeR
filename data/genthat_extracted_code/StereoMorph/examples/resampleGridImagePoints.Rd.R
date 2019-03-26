library(StereoMorph)


### Name: resampleGridImagePoints
### Title: Resamples imaged grid points
### Aliases: resampleGridImagePoints

### ** Examples

## FIND THE FILE DIRECTORY FOR EXTRA R PACKAGE FILES
fdir <- paste0(path.package("StereoMorph"), "/extdata/")

## GET GRID POINTS
file <- paste0(fdir, "cal_a1_v2.txt")

## SET NUMBER OF GRID ROWS AND COLUMNS
nx <- 21
ny <- 14

## READ THE GRID POINTS INTO A MATRIX
## OUTPUT OF FUNCTION IS AN ARRAY SO WE TAKE THE FIRST ENTRY TO GET MATRIX
coor.2d <- as.matrix(read.table(file))

## RESAMPLE THE GRID WITH THE SAME NUMBER OF POINTS AS IN ORIGINAL
coor_2d_same <- resampleGridImagePoints(pts=coor.2d, nx=nx, rx=21, ry=14, 
 print.progress=TRUE)

## RESAMPLE THE GRID WITH A REDUCED NUMBER OF POINTS (4 X 4)
coor_2d_red <- resampleGridImagePoints(pts=coor.2d, nx=nx, rx=4, ry=4, 
 fit.min.break=1, print.progress=TRUE)

## PLOT THE ORIGINAL IMAGED POINTS
plot(coor.2d)

## PLOT THE MODELED GRID POINTS WITHIN THE ORIGINAL POINTS
## THE MODEL GOODNESS-OF-FIT CAN BE EVALUATED VISUALLY
points(coor_2d_same$pts, col='red', cex=0.75)

## PLOT THE REDUCED NUMBER OF GRID POINTS
points(coor_2d_red$pts, col='green', lwd=2, cex=1.25)

## PLOT A HISTOGRAM OF THE FIT ERROR
## HERE UNITS ARE PIXELS - MOST POINTS ARE FIT WITHIN 2 PIXELS
hist(coor_2d_same$error)



