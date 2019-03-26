library(loa)


### Name: 2.1.specialist.panels
### Title: Special panel functions 01
### Aliases: 2.1.specialist.panels panel.kernelDensity panel.binPlot
###   panel.surfaceSmooth panel.loaLevelPlot
### Keywords: methods

### ** Examples


## Example 1
## for data already set up for levelplot

loaPlot(volcano, panel=panel.loaLevelPlot)

## Example 2
## Surface smooth

loaPlot(copper~longitude*latitude, data= lat.lon.meuse, 
        panel=panel.surfaceSmooth, grid=TRUE, 
        too.far=0.1, col.regions=3:2)




