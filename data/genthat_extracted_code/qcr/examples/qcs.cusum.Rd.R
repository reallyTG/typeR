library(qcr)


### Name: qcs.cusum
### Title: Function to plot the cusum chart
### Aliases: qcs.cusum qcs.cusum.default qcs.cusum.qcd

### ** Examples


library(qcr)
data(pistonrings)
attach(pistonrings)
res.qcd <- qcd(pistonrings, type.data = "dependence")
res.qcs <- qcs.cusum(res.qcd, type = "cusum")
summary(res.qcs)
plot(res.qcs)




