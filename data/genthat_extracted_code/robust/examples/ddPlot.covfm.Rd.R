library(robust)


### Name: ddPlot.covfm
### Title: Distance - Distance Plot
### Aliases: ddPlot.covfm
### Keywords: hplot

### ** Examples

 data(woodmod.dat)
 woodm.fm <- fit.models(list(Robust = "covRob", Classical = "covClassic"),
                        data = woodmod.dat)
 ddPlot.covfm(woodm.fm, main = "Plot Title", xlab = "x-axis label",
              ylab = "y-axis label", pch = 4, col = "purple")



