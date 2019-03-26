library(GGally)


### Name: getPlot
### Title: getPlot
### Aliases: getPlot [.ggmatrix
### Keywords: hplot

### ** Examples

 data(tips, package = "reshape")
 plotMatrix2 <- ggpairs(tips[, 3:2], upper = list(combo = "denstrip"))
 plotMatrix2[1, 2]



