library(robust)


### Name: ellipsesPlot.covfm
### Title: Ellipses Plot - Visual Correlation Matrix Comparison
### Aliases: ellipsesPlot.covfm
### Keywords: hplot

### ** Examples

  data(woodmod.dat)
  woodm.fm <- fit.models(list(Robust = "covRob", Classical = "covClassic"),
                         data = woodmod.dat)
  ellipsesPlot.covfm(woodm.fm)



