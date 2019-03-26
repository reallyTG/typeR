library(FLightR)


### Name: plot_likelihood
### Title: plot likelihood surface over map
### Aliases: plot_likelihood

### ** Examples

File<-system.file("extdata", "Godwit_TAGS_format.csv", package = "FLightR")
# to run example fast we will cut the real data file by 2013 Aug 20
Proc.data<-get.tags.data(File, end.date=as.POSIXct('2013-07-02', tz='GMT'))
Calibration.periods<-data.frame(
       calibration.start=as.POSIXct(c(NA, "2014-05-05")),
       calibration.stop=as.POSIXct(c("2013-08-20", NA)),
       lon=5.43, lat=52.93) 
       #use c() also for the geographic coordinates, if you have more than one calibration location
       # (e. g.,  lon=c(5.43, 6.00), lat=c(52.93,52.94))

# NB Below likelihood.correction is set to FALSE for fast run! 
# Leave it as default TRUE for real examples
Calibration<-make.calibration(Proc.data, Calibration.periods, likelihood.correction=FALSE)

Grid<-make.grid(left=0, bottom=50, right=10, top=56,
  distance.from.land.allowed.to.use=c(-Inf, Inf),
  distance.from.land.allowed.to.stay=c(-Inf, Inf))

all.in<-make.prerun.object(Proc.data, Grid, start=c(5.43, 52.93),
                             Calibration=Calibration, threads=2)
plot_likelihood(all.in, twilight.index=10)




