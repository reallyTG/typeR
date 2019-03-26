library(robust)


### Name: screePlot.covfm
### Title: Comparison Screeplot
### Aliases: screePlot.covfm
### Keywords: hplot

### ** Examples

  data(woodmod.dat)
  woodm.fm <- fit.models(list(Robust = "covRob", Classical = "covClassic"),
                         data = woodmod.dat)
  screePlot.covfm(woodm.fm, main = "Plot Title", xlab = "x-axis label",
                  ylab = "y-axis label", pch = 4:5)



