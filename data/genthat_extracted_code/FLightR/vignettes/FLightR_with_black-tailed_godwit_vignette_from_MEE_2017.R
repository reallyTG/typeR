## ---- eval = F-----------------------------------------------------------
#  install.packages('FLightR')

## ---- eval = F-----------------------------------------------------------
#  library(devtools)
#  install_github('eldarrak/FLightR@0.4.5')

## ---- eval = F-----------------------------------------------------------
#  install_github('eldarrak/FLightR')

## ------------------------------------------------------------------------
library(FLightR)

## ---- eval=FALSE, tidy=FALSE---------------------------------------------
#  download.file('https://git.io/vrJgv', 'example_TAGS_format.csv')

## ---- eval=FALSE, tidy=FALSE---------------------------------------------
#  Proc.data<-get.tags.data("example_TAGS_format.csv")

## ---- eval = F-----------------------------------------------------------
#  Calibration.periods<-data.frame(
#          calibration.start=as.POSIXct(c(NA, "2014-05-05")),
#          calibration.stop=as.POSIXct(c("2013-08-20", NA)),
#          lon=5.43, lat=52.93)
#  		#use c() also for the geographic coordinates,
#  		#if you have more than one calibration location
#  		# (e. g.,  lon=c(5.43, 6.00), lat=c(52.93,52.94))
#  print(Calibration.periods)

## ---- eval = F-----------------------------------------------------------
#  Calibration<-make.calibration(Proc.data, Calibration.periods)

## ---- eval = F-----------------------------------------------------------
#  plot_slopes_by_location(Proc.data=Proc.data, location=c(5.43, 52.93))

## ---- eval = F-----------------------------------------------------------
#  abline(v=as.POSIXct("2013-08-20")) # end of first calibration period
#  abline(v=as.POSIXct("2014-05-05")) # start of the second calibration period

## ---- eval=FALSE---------------------------------------------------------
#  # ~ 15 min run time
#  Location<-find.stationary.location(Proc.data, '2013-07-20', '2013-08-20',
#                                     initial.coords=c(10, 50))

## ---- eval = F-----------------------------------------------------------
#  Grid<-make.grid(left=-14, bottom=30, right=13, top=57,
#     distance.from.land.allowed.to.use=c(-Inf, Inf),
#     distance.from.land.allowed.to.stay=c(-Inf, Inf))

## ---- eval = F-----------------------------------------------------------
#  # ~ 15 min run time
#  all.in<-make.prerun.object(Proc.data, Grid, start=c(5.43, 52.93), Calibration=Calibration)

## ---- eval = F-----------------------------------------------------------
#  nParticles=1e6
#  # ~ 45 min run time
#  Result<-run.particle.filter(all.in, threads=-1,
#              nParticles=nParticles, known.last=TRUE,
#  		    precision.sd=25, check.outliers=F)
#  save(Result, file="Result.bltg.ageing.model.noOD.RData")

## ---- eval = F-----------------------------------------------------------
#  Index<-which(Result$Spatial$Grid[,1]>(2))

## ---- eval = F-----------------------------------------------------------
#  Arrivals.NL<-find.times.distribution(Result,Index)
#  Arrivals.NL

## ---- eval = F-----------------------------------------------------------
#  stationary.migration.summary(Result, prob.cutoff = 0.1, min.stay = 3)

## ---- eval = F-----------------------------------------------------------
#  map.FLightR.ggmap(Result)

## ---- eval = F-----------------------------------------------------------
#  plot_lon_lat(Result)

## ---- eval = F-----------------------------------------------------------
#  plot_util_distr(Result,
#      dates=data.frame(as.POSIXct('2013-12-01'), as.POSIXct('2014-01-31')),
#      add.scale.bar=TRUE, percentiles=0.5)

