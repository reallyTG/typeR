library(inlmisc)


### Name: AddGradientLegend
### Title: Add Color Gradient Legend to Plot
### Aliases: AddGradientLegend
### Keywords: hplot

### ** Examples

plot(NA, xlim = c(0, 100), ylim = c(-10, 10),
     xlab = "x", ylab = "y", xaxs = "i", yaxs = "i")
breaks <- 0:200
AddGradientLegend(breaks, title = "Title", loc = "bottomleft")
AddGradientLegend(breaks, pal = GetColors(scheme = "iridescent"),
                  title = "Title", loc = "bottomleft", inset = c(0.2, 0.1))
breaks <- seq(0, 2e+06, length.out = 5)
AddGradientLegend(breaks, pal = GetColors(scheme = "discrete rainbow"),
                  scientific = TRUE, strip.dim = c(1, 14), inset = c(0.2, 0.1))
AddGradientLegend(breaks, pal = GetColors(scheme = "YlOrBr"),
                  loc = "topright", inset = 0.1)




