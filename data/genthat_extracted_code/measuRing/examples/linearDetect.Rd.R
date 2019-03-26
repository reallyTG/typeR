library(measuRing)


### Name: linearDetect
### Title: Linear detection
### Aliases: linearDetect

### ** Examples

## (not run) Read one image section in package measuRing:
image1 <- system.file("P105_a.tif", package="measuRing")    
## (not run) smoothed gray:
smoothed <- graySmoothed(image1)
## linear detection:
borders <- linearDetect(smoothed)
str(borders)



