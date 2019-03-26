library(geoelectrics)


### Name: plotLegend
### Title: Plots Legend
### Aliases: plotLegend plotLegend,ProfileSet-method
###   plotLegend,Profile-method

### ** Examples

data(sinkhole)

plotLegend(sinkhole)

# for linear scale:
plotLegend(sinkhole@profiles[[1]],
           trafo=function(x) x,
           backtrafo=function(x) x,
           minData=100, maxData=50000)



