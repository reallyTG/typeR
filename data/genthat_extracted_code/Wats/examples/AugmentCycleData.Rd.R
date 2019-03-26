library(Wats)


### Name: AugmentCycleData
### Title: Calculates variables necessary for WATS Plots
### Aliases: AugmentCycleData AugmentYearDataWithMonthResolution
###   AugmentYearDataWithSecondResolution

### ** Examples

library(Wats)
dsLinear <- CountyMonthBirthRate2005Version
dsLinear <- dsLinear[dsLinear$CountyName=="oklahoma", ]
dsLinear <- AugmentYearDataWithMonthResolution(dsLinear=dsLinear, dateName="Date")
head(dsLinear)




