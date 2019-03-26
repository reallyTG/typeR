library(HyperbolicDist)


### Name: logHist
### Title: Plot Log-Histogram
### Aliases: logHist
### Keywords: hplot distribution

### ** Examples

data(SandP500)
### Consider proportional changes in the index
change <- SandP500[-length(SandP500)]/SandP500[-1]
hist(change)
logHist(change)
### Show points only
logHist(change, htype = "p", pch = 20, cex = 0.5)
### Fit the hyperbolic distribution to the changes
hyperbFit(change)



