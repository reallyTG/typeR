library(DepthProc)


### Name: plot,LSDepthContour,ANY-method
### Title: Plot Location-Scale depth contours.
### Aliases: plot,LSDepthContour,ANY-method

### ** Examples


smp <- rf(100, 5, 10)
x <- lsdSampleDepthContours(smp)
plot(x, col = paste0("grey", col = rev(seq(10, 40, 10))))




