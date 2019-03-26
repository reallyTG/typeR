library(gvlma)


### Name: display.delstats
### Title: Plot Deletion Statistics and Their P-Values for Assessment of
###   Unusual Observations
### Aliases: display.delstats
### Keywords: graphs

### ** Examples

data(CarMileageData)
CarMileageAssess <- gvlma(NumGallons ~ MilesLastFill + NumDaysBetw,
data = CarMileageData)
CarMileageDel <- deletion.gvlma(CarMileageAssess)
plot(CarMileageDel)
display.delstats(CarMileageDel$DeltaGlobalStat, CarMileageDel$GStatpvalue)
display.delstats(CarMileageDel$DeltaStat1, CarMileageDel$Stat1pvalue)



