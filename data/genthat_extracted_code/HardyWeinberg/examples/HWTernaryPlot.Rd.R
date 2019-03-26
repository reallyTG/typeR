library(HardyWeinberg)


### Name: HWTernaryPlot
### Title: Ternary plot with the Hardy-Weinberg acceptance region
### Aliases: HWTernaryPlot
### Keywords: aplot

### ** Examples


n <- 100 # sample size
m <- 100 # number of markers

X <- HWData(n,m)
HWTernaryPlot(X,100,region=1,hwcurve=TRUE,vbounds=FALSE,vertex.cex=2)



