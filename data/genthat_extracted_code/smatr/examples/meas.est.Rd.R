library(smatr)


### Name: meas.est
### Title: Measurement error variance estimation from repeated measures
### Aliases: meas.est
### Keywords: models regression

### ** Examples

#load the individual level leaf example dataset
data(leafmeas)

#Estimate measurement error variance matrix, store in "meas.vr"
meas.vr <- meas.est(leafmeas[,3:4], leafmeas$spp)



