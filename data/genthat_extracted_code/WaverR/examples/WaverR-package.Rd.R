library(WaverR)


### Name: WaverR-package
### Title: Data Estimation using Weighted Averages of Multiple Regressions
### Aliases: WaverR-package WaverR
### Keywords: Data Estimation Multiple Regressions

### ** Examples

AllIrisMeasurements<-iris[,1:4]
Xremove<-sample(1:150, 20,replace=TRUE)
Yremove<-sample(1:4, 20,replace=TRUE)
AllIrisMeasurementsWithNA<-AllIrisMeasurements
for (i in 1:20){AllIrisMeasurementsWithNA[Xremove[i],Yremove[i]]<-NA}
waverr(RawData=AllIrisMeasurementsWithNA,Nrepeats=100)



