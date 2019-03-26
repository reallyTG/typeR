library(robust)


### Name: distancePlot.covfm
### Title: Side-by-Side Mahalanobis Distance Plot
### Aliases: distancePlot.covfm
### Keywords: hplot

### ** Examples

  data(woodmod.dat)
  woodm.fm <- fit.models(list(Robust = "covRob", Classical = "covClassic"),
                         data = woodmod.dat)
  distancePlot.covfm(woodm.fm, main = "Plot Title", xlab = "x-axis label",
                     ylab = "y-axis label", pch = 4, col = "purple")



