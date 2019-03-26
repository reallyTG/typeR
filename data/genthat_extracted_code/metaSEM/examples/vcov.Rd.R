library(metaSEM)


### Name: vcov
### Title: Extract Covariance Matrix Parameter Estimates from Objects of
###   Various Classes
### Aliases: vcov.tssem1FEM vcov.tssem1FEM.cluster vcov.tssem1REM vcov.wls
###   vcov.wls.cluster vcov.meta vcov.meta3X vcov.reml vcov.MxRAMModel
###   vcov.osmasem
### Keywords: methods

### ** Examples

## Random-effects meta-analysis
model1 <- meta(y=yi, v=vi, data=Hox02)
vcov(model1)

## Fixed-effects only
vcov(model1, select="fixed")

## Random-effects only
vcov(model1, select="random")



