library(robust)


### Name: qqPlot.fdfm
### Title: Comparison Quantile-Quantile Plot
### Aliases: qqPlot.fdfm
### Keywords: hplot

### ** Examples

  data(los, package = "robustbase")
  los.fm <- fit.models(c(Robust = "fitdstnRob", MLE = "fitdstn"),
                         x = los, densfun = "gamma")
  qqPlot.fdfm(los.fm, xlab = "x-axis label", ylab = "y-axis label",
              main = "Plot Title", pch = 4, col = "purple")



