library(FLightR)


### Name: run.particle.filter
### Title: Run Particle Filter
### Aliases: run.particle.filter

### ** Examples

File<-system.file("extdata", "Godwit_TAGS_format.csv", package = "FLightR")
# to run example fast we will cut the real data file by 2013 Aug 20
Proc.data<-get.tags.data(File, end.date=as.POSIXct('2013-07-02', tz='GMT'))
Calibration.periods<-data.frame(
       calibration.start=NA,
       calibration.stop=as.POSIXct("2013-08-20"),
       lon=5.43, lat=52.93) 
       #use c() also for the geographic coordinates, if you have more than one calibration location
       # (e. g.,  lon=c(5.43, 6.00), lat=c(52.93,52.94))
print(Calibration.periods)

# NB Below likelihood.correction is set to FALSE for fast run! 
# Leave it as default TRUE for real examples
Calibration<-make.calibration(Proc.data, Calibration.periods, likelihood.correction=FALSE)

Grid<-make.grid(left=0, bottom=50, right=10, top=56,
  distance.from.land.allowed.to.use=c(-Inf, Inf),
  distance.from.land.allowed.to.stay=c(-Inf, Inf))

all.in<-make.prerun.object(Proc.data, Grid, start=c(5.43, 52.93),
                             Calibration=Calibration, threads=2)
# here we will run only 1e4 partilces for a very short track.
# One should use 1e6 particles for the full run.
Result<-run.particle.filter(all.in, threads=1,
           nParticles=1e3, known.last=TRUE,
           precision.sd=25, check.outliers=FALSE)




