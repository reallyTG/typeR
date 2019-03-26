library(CENFA)


### Name: stretchPlot
### Title: Contrast adjustments for RasterLayer plots
### Aliases: stretchPlot stretchPlot,RasterLayer-method

### ** Examples

mod <- enfa(x = climdat.hist, s.dat = ABPR, field = "CODE")
sm <- sensitivity_map(mod)
stretchPlot(sm)
stretchPlot(sm, type = "hist.equal")
stretchPlot(sm, type = "sd", n = 2)




