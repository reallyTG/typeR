library(DepthProc)


### Name: lsdAddContour
### Title: Adds location scale depth contour to the existing plot.
### Aliases: lsdAddContour lsdAddContour,LSDepthContour-method

### ** Examples

smp <- rf(100, 5, 10)
x <- lsdSampleDepthContours(smp)
plot(x)
lsdAddContour(x, 0.1, col = "grey50")
lsdAddContour(x, 0.3, col = "grey10", border = "red", lwd = 4)



