library(s2dverification)


### Name: PlotStereoMap
### Title: Maps A Two-Dimensional Variable On A Polar Stereographic
###   Projection
### Aliases: PlotStereoMap
### Keywords: dynamic

### ** Examples

data <- matrix(rnorm(100 * 50), 100, 50)
x <- seq(from = 0, to = 360, length.out = 100)
y <- seq(from = -90, to = 90, length.out = 50)
PlotStereoMap(data, x, y, latlims = c(60, 90), brks = 50,
              toptitle = "This is the title")



