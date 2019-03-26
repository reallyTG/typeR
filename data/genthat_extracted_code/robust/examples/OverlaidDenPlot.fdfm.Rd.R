library(robust)


### Name: overlaidDenPlot.fdfm
### Title: Overlaid Density Plot
### Aliases: overlaidDenPlot.fdfm
### Keywords: hplot

### ** Examples

  data(los, package="robustbase")
  los.fm <- fit.models(c(Robust = "fitdstnRob", MLE = "fitdstn"),
                         x = los, densfun = "gamma")
  overlaidDenPlot.fdfm(los.fm, xlab = "x-axis label", ylab = "y-axis label",
                       main = "Plot Title")



