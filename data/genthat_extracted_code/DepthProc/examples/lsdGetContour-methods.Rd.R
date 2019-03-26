library(DepthProc)


### Name: lsdGetContour
### Title: Get location-scale contour from LSDepthContour object.
### Aliases: lsdGetContour lsdGetContour,LSDepthContour-method

### ** Examples

dcont <- lsdSampleDepthContours(rf(200, 4, 7), depth = c(0.1, 0.2))

# get contour that is present in dcont object
lsdGetContour(dcont, 0.1)

# get contour that is not present in dcont
# it will be automatically calculated
lsdGetContour(dcont, 0.3)



