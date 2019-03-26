library(StereoMorph)


### Name: readBezierControlPoints
### Title: Reads a file of Bezier control points
### Aliases: readBezierControlPoints
### Keywords: read functions

### ** Examples

## GET FILE DIRECTORY FOR PACKAGE FILES
fdir <- paste0(path.package("StereoMorph"), "/extdata/")

## FILE TO READ
file <- paste0(fdir, "bezier_control_points_a2_v", 1:2, ".txt")

## FILE TO READ
bcp <- readBezierControlPoints(file=file)



