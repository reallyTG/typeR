library(DistributionUtils)


### Name: logHist
### Title: Plot Log-Histogram
### Aliases: logHist
### Keywords: hplot distribution

### ** Examples

x <- rnorm(200)
hist(x)
### default
logHist(x)
### log histogram only
logHist(x, htype = "h")
### points only, some options
logHist(x, htype = "p", pch = 20, cex = 2, col = "steelblue")



