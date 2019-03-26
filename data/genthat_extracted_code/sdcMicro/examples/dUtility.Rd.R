library(sdcMicro)


### Name: dUtility
### Title: data utility
### Aliases: dUtility
### Keywords: manip

### ** Examples

data(free1)
free1 <- as.data.frame(free1)
m1 <- microaggregation(free1[, 31:34], method="onedims", aggr=3)
m2 <- microaggregation(free1[, 31:34], method="pca", aggr=3)
dRisk(obj=free1[, 31:34], xm=m1$mx)
dRisk(obj=free1[, 31:34], xm=m2$mx)
dUtility(obj=free1[, 31:34], xm=m1$mx)
dUtility(obj=free1[, 31:34], xm=m2$mx)
data(Tarragona)
x <- Tarragona[, 5:7]
y <- addNoise(x)$xm
dRiskRMD(x, xm=y)
dRisk(x, xm=y)
dUtility(x, xm = y, method = " IL1")
dUtility(x, xm = y, method = " IL1s")
dUtility(x, xm = y, method = "eigen")
dUtility(x, xm = y, method = "robeigen")

## for objects of class sdcMicro:
data(testdata2)
sdc <- createSdcObj(testdata2,
  keyVars=c('urbrur','roof','walls','water','electcon','relat','sex'),
  numVars=c('expend','income','savings'), w='sampling_weight')
## this is already made internally:
## sdc <- dUtility(sdc)
## and already stored in sdc




