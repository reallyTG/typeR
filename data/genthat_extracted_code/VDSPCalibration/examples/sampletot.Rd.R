library(VDSPCalibration)


### Name: sampletot
### Title: Samples Selection
### Aliases: sampletot

### ** Examples


VD.value= 60 + 25*rnorm(1000)
VD.index=1:1000

### x:     the VD value
### index: the index for VD value, it can be 1, 2, 3,....
### n0:    the number of samples we want to select
### K:     the number of quantiles, it is 4 if we use quartiles

sampletot(x=VD.value, index=VD.index, n0=100, K=4)



