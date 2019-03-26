library(tools4uplift)


### Name: BinUplift
### Title: Univariate categorization
### Aliases: BinUplift
### Keywords: tree binning

### ** Examples


library(tools4uplift)
data("SimUplift")

binX1 <- BinUplift(data = SimUplift, treat = "treat", outcome = "y", x = "X1", 
                  alpha = 0.10, n.min = 3, title = "Binning for X1")




