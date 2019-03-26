library(dse)


### Name: addPlotRoots
### Title: Add Model Roots to a plot
### Aliases: addPlotRoots
### Keywords: ts

### ** Examples

data("eg1.DSE.data.diff", package="dse")
model <- estVARXls(eg1.DSE.data.diff)
plot(roots(model))
addPlotRoots(toSS(model))



