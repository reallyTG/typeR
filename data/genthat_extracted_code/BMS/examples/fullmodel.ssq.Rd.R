library(BMS)


### Name: fullmodel.ssq
### Title: OLS Statistics for the Full Model Including All Potential
###   Covariates
### Aliases: fullmodel.ssq
### Keywords: utilities

### ** Examples

data(datafls)
mm=bms(datafls)

fullmodel.ssq(mm)

#equivalent:
fullmodel.ssq(mm$X.data)





