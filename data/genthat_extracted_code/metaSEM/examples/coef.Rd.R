library(metaSEM)


### Name: coef
### Title: Extract Parameter Estimates from various classes.
### Aliases: coef.tssem1FEM coef.tssem1FEM.cluster coef.tssem1REM coef.wls
###   coef.wls.cluster coef.meta coef.meta3X coef.reml coef.MxRAMModel
###   coef.osmasem
### Keywords: methods

### ** Examples

## Random-effects meta-analysis
model1 <- meta(y=yi, v=vi, data=Hox02)
coef(model1)

## Fixed-effects only
coef(model1, select="fixed")



