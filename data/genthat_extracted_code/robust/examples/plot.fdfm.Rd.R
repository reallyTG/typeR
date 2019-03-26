library(robust)


### Name: plot.fdfm
### Title: fdfm Plot Method
### Aliases: plot.fdfm
### Keywords: hplot

### ** Examples

  data(los, package = "robustbase")
  los.fm <- fit.models(c(Robust = "fitdstnRob", MLE = "fitdstn"),
                         x = los, densfun = "gamma")
  plot(los.fm)



