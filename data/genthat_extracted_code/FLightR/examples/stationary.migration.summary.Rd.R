library(FLightR)


### Name: stationary.migration.summary
### Title: find potential stationary periods and estimates their location
###   and movement schedule
### Aliases: stationary.migration.summary

### ** Examples

File<-system.file("extdata", "Godwit_TAGS_format.csv", package = "FLightR")
# to run example fast we will cut the real data file by 2013 Aug 20
Proc.data<-get.tags.data(File, end.date=as.POSIXct('2013-06-25', tz='GMT'))
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
                             Calibration=Calibration, threads=1)
# here we will run only 1e4 partilces for a very short track.
# One should use 1e6 particles for the full run.
Result<-run.particle.filter(all.in, threads=1,
           nParticles=1e3, known.last=TRUE,
           precision.sd=25, check.outliers=FALSE)

Summary<-stationary.migration.summary(Result, prob.cutoff=1)
# Use lower cut offs for real runs!



