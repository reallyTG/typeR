library(sdcMicro)


### Name: plotMicro
### Title: Comparison plots
### Aliases: plotMicro
### Keywords: aplot

### ** Examples


data(free1)
free1 <- as.data.frame(free1)
m1 <- microaggregation(free1[, 31:34], method="onedims", aggr=3)
m2 <- microaggregation(free1[, 31:34], method="pca", aggr=3)
plotMicro(m1, p=1, which.plot=1)




