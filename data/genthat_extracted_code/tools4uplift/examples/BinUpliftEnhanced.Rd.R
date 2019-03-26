library(tools4uplift)


### Name: BinUpliftEnhanced
### Title: Univariate categorization - augmented data
### Aliases: BinUpliftEnhanced
### Keywords: tree binning

### ** Examples


library(tools4uplift)
data("SimUplift")

train.enhanced <- BinUpliftEnhanced(data = SimUplift, treat = "treat", outcome = "y", 
                                    var.list = colnames(SimUplift[,3:7]))



