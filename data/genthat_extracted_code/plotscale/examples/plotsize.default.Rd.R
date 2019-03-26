library(plotscale)


### Name: plotsize.default
### Title: Determine Plot Size by Default
### Aliases: plotsize.default

### ** Examples

options(ask.default = FALSE)
options(device.ask.default = FALSE)
library(lattice)
p <- xyplot(2~3)
plotsize(p, width = 7, height = 7)



