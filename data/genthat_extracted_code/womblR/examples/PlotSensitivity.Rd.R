library(womblR)


### Name: PlotSensitivity
### Title: PlotSensitivity
### Aliases: PlotSensitivity

### ** Examples

data(VFSeries)
PlotSensitivity(Y = VFSeries$DLS[VFSeries$Visit == 1],
                  main = "Sensitivity estimate (dB) at each \n location on visual field",
                  legend.lab = "DLS (dB)",
                  zlim = c(10, 35),
                  bins = 250)



