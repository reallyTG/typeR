library(StereoMorph)


### Name: pointsAtEvenSpacing
### Title: Generates evenly spaced points from point matrix
### Aliases: pointsAtEvenSpacing

### ** Examples

## LINEAR INTERPOLATION ##
## CREATE A MATRIX OF TWO POINTS
two_points <- matrix(c(0, 10, 0, 10), nrow=2, ncol=2)

## GENERATE 20 POINTS ALONG THE LINE
pts_aes <- pointsAtEvenSpacing(x=two_points, n=20)

## PLOT THE LINE
plot(two_points, type='l')

## AND THE POINTS ALONG THE LINE
points(pts_aes, col='red')


## POINTS ALONG A CURVE ##
## GET FILE DIRECTORY FOR PACKAGE FILES
fdir <- paste0(path.package("StereoMorph"), "/extdata/")

## GET 3D LANDMARK AND CURVE POINT FILE AND READ INTO A MATRIX
lm.matrix <- readLandmarksToMatrix(paste0(fdir, "lm_3d_a2.txt"), row.names=1)

## PLOT THE LANDMARKS AND CURVE POINTS
pts <- na.omit(lm.matrix)
r <- abs(apply(pts, 2, 'max') - apply(pts, 2, 'min'))

## Not run: 
##D ## PLOT USING THE RGL PACKAGE
##D plot3d(pts, aspect=c(r[1]/r[3], r[2]/r[3], 1), size=0.5)
## End(Not run)

## CONVERT LANDMARKS TO LIST FORMAT TO EASILY ACCESS CURVE POINTS
lm.list <- landmarkMatrixToList(lm.matrix)

## CREATE 10 EVENLY SPACED POINTS ALONG ONE CURVE
lm.list$pterygoid_crest_R <- pointsAtEvenSpacing(x=lm.list$pterygoid_crest_R, n=10)

## CREATE 15 ALONG ANOTHER
lm.list$tomium_R <- pointsAtEvenSpacing(x=lm.list$tomium_R, n=15)

## CONVERT BACK TO MATRIX
lm.matrix <- landmarkListToMatrix(lm.list)

## Not run: 
##D ## PLOT NEW EVENLY SPACED POINTS WITH PREVIOUS POINTS
##D plot3d(lm.matrix, add=T, size=4, col='red')
## End(Not run)



