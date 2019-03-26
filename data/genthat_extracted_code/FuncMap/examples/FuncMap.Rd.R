library(FuncMap)


### Name: FuncMap
### Title: Hive Plots of R Package Function Calls
### Aliases: FuncMap
### Keywords: hplot

### ** Examples

require(mvbutils)
require(lattice)
require(grid)
# draw the foodweb using mvbutils
fw <- foodweb(where = "package:lattice", charlim = 20, cex = 0.5, lwd = 1)
# draw the hive plot
ans <- FuncMap(fwb = fw, pkg = "lattice", method = "abs")



