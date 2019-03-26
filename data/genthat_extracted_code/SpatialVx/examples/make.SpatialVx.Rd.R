library(SpatialVx)


### Name: make.SpatialVx
### Title: Spatial Verification Sets - SpatialVx Object
### Aliases: make.SpatialVx hist.SpatialVx plot.SpatialVx print.SpatialVx
###   summary.SpatialVx
### Keywords: manip hplot

### ** Examples

data( "UKobs6" )
data( "UKfcst6" )
data( "UKloc" )

hold <- make.SpatialVx( UKobs6, UKfcst6, thresholds = c(0.01, 20.01),
    loc = UKloc, field.type = "Precipitation", units = "mm/h",
    data.name = "Nimrod", obs.name = "Observations 6", model.name = "Forecast 6",
    map = TRUE)

hold

plot( hold )

hist( hold )

hist( hold, threshold.num = 2 )

## Not run: 
##D # Stage 2 Observation files from
##D # NSSL/NCEP Spring 2005 Forecast Experiment.
##D data( "obs0426" )
##D data( "obs0513" )
##D data( "obs0514" )
##D data( "obs0518" )
##D data( "obs0519" )
##D data( "obs0525" )
##D data( "obs0601" )
##D data( "obs0603" )
##D data( "obs0604" )
##D 
##D st2 <- array(c(c(obs0426), c(obs0513), c(obs0514), c(obs0518),
##D     c(obs0519), c(obs0525), c(obs0601), c(obs0603), c(obs0604)),
##D     dim=c(601, 501, 9))
##D 
##D rm(obs0426, obs0513, obs0514, obs0518, obs0519, obs0525, obs0601,
##D     obs0603, obs0604)
##D 
##D # wrf2caps
##D data( "wrf2caps0425" )
##D data( "wrf2caps0512" )
##D data( "wrf2caps0513" )
##D data( "wrf2caps0517" )
##D data( "wrf2caps0518" )
##D data( "wrf2caps0524" )
##D data( "wrf2caps0531" )
##D data( "wrf2caps0602" )
##D data( "wrf2caps0603" )
##D 
##D # wrf4ncar
##D data( "wrf4ncar0425" )
##D data( "wrf4ncar0512" )
##D data( "wrf4ncar0513" )
##D data( "wrf4ncar0517" )
##D data( "wrf4ncar0518" )
##D data( "wrf4ncar0524" )
##D data( "wrf4ncar0531" )
##D data( "wrf4ncar0602" )
##D data( "wrf4ncar0603" )
##D 
##D # wrf4ncep
##D data( "wrf4ncep0425" )
##D data( "wrf4ncep0512" )
##D data( "wrf4ncep0513" )
##D data( "wrf4ncep0517" )
##D data( "wrf4ncep0518" )
##D data( "wrf4ncep0524" )
##D data( "wrf4ncep0531" )
##D data( "wrf4ncep0602" )
##D data( "wrf4ncep0603" )
##D 
##D wrf2caps <- array(c(c(wrf2caps0425), c(wrf2caps0512),
##D     c(wrf2caps0513), c(wrf2caps0517), c(wrf2caps0518),
##D     c(wrf2caps0524), c(wrf2caps0531), c(wrf2caps0602),
##D     c(wrf2caps0603)),
##D     dim=c(601, 501, 9))
##D 
##D wrf4ncar <- array(c(c(wrf4ncar0425), c(wrf4ncar0512),
##D     c(wrf4ncar0513), c(wrf4ncar0517), c(wrf4ncar0518),
##D     c(wrf4ncar0524), c(wrf4ncar0531), c(wrf4ncar0602),
##D     c(wrf4ncar0603)),
##D     dim=c(601, 501, 9))
##D 
##D wrf4ncep <- array(c(c(wrf4ncep0425), c(wrf4ncep0512),
##D     c(wrf4ncep0513), c(wrf4ncep0517), c(wrf4ncep0518),
##D     c(wrf4ncep0524), c(wrf4ncep0531), c(wrf4ncep0602),
##D     c(wrf4ncep0603)),
##D     dim=c(601, 501, 9))
##D 
##D rm(wrf2caps0425, wrf2caps0512, wrf2caps0513, wrf2caps0517,
##D     wrf2caps0518, wrf2caps0524, wrf2caps0531, wrf2caps0602,
##D     wrf2caps0603, wrf4ncar0425, wrf4ncar0512, wrf4ncar0513,
##D     wrf4ncar0517, wrf4ncar0518, wrf4ncar0524, wrf4ncar0531,
##D     wrf4ncar0602, wrf4ncar0603, wrf4ncep0425, wrf4ncep0512,
##D     wrf4ncep0513, wrf4ncep0517, wrf4ncep0518, wrf4ncep0524,
##D     wrf4ncep0531, wrf4ncep0602, wrf4ncep0603)
##D 
##D fcst <- list(wrf2caps, wrf4ncar, wrf4ncep)
##D 
##D rm(wrf2caps, wrf4ncar, wrf4ncep)
##D 
##D # Now, create the object.
##D data( "ICPg240Locs" )
##D 
##D ICPreal <- make.SpatialVx( st2, fcst, thresholds = c(0.1, 20.1),
##D     loc = ICPg240Locs, projection = TRUE, loc.byrow = TRUE,
##D     time.vals = c(2005042600, 2005051300, 2005051400, 2005051800,
##D         2005051900, 2005052500, 2005060100, 2005060300, 2005060400),
##D     map = TRUE, field.type = "Precipitation", units = "mm/h",
##D     data.name = "ICP Real Test Cases",
##D     obs.name = "Stage II Analysis",
##D     model.name = c( "WRF 2 CAPS", "WRF 4 NCAR", "WRF 4 NCEP"))
##D 
##D plot( ICPreal )
##D 
##D plot( ICPreal, time.point = mean )
##D 
##D plot( ICPreal, model = 2 )
##D 
##D plot( ICPreal, model = 3 )
##D 
##D plot( ICPreal, time.point = 2, model = 2 )
##D 
## End(Not run)



