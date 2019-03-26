library(FLightR)


### Name: make.calibration
### Title: Creates a calibration object, further used for calculation of
###   coordinates in the 'run.particle.filter'.
### Aliases: make.calibration

### ** Examples

File<-system.file("extdata", "Godwit_TAGS_format.csv", package = "FLightR")
Proc.data<-get.tags.data(File, end.date=as.POSIXct('2013-08-20', tz='GMT'))
Calibration.periods<-data.frame(
       calibration.start=NA,
       calibration.stop=as.POSIXct("2013-08-20"),
       lon=5.43, lat=52.93) 
       #use c() also for the geographic coordinates, if you have more than one calibration location
       # (e. g.,  lon=c(5.43, 6.00), lat=c(52.93,52.94))
print(Calibration.periods)

# NB Below likelihood.correction is set to FALSE for fast run! 
# Leave it as default 'auto' for real examples
Calibration<-make.calibration(Proc.data, Calibration.periods, likelihood.correction=FALSE)




