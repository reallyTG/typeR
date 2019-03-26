library(RNCEP)


### Name: NCEP.flight
### Title: Simulate Trajectories
### Aliases: NCEP.flight

### ** Examples

library(RNCEP)
## Use NCEP.flight(), to simulate a flight over the North Sea 
## from Norway to the Netherlands using NCEP wind data
## queried automatically from the NCEP Reanalysis datset ##
## Not run: 
##D tst <- NCEP.flight(beg.loc=c(58.00,7.00), 
##D   end.loc=c(53.00,7.00), begin.dt='2007-10-01 18:00:00',
##D   flow.assist='NCEP.Tailwind', fa.args=list(airspeed=12),
##D   path='loxodrome', calibrate.dir=FALSE, calibrate.alt=FALSE,
##D   cutoff=0, when2stop='latitude', levels2consider=c(850,925),
##D   hours=12, evaluation.interval=60, id=1, land.if.bad=FALSE,
##D   reanalysis2 = FALSE)
## End(Not run)
  

#######################################################
## Use NCEP.flight(), to simulate a flight without 
## querying the NCEP database.  In this case, we use
## constant wind conditions (i.e. u=2 and v=0). ##
tst2 <- NCEP.flight(beg.loc=c(58.00,7.00), end.loc=c(53.00,7.00), 
  begin.dt='2007-10-01 18:00:00', flow.assist='NCEP.Tailwind', 
  fa.args=list(u=2, v=0, airspeed=12), path='loxodrome',
  calibrate.dir=TRUE, calibrate.alt=FALSE, cutoff=-10, when2stop='latitude', 
  levels2consider=850, hours=12, evaluation.interval=60, 
  id=1, land.if.bad=FALSE, reanalysis2 = FALSE, query=FALSE)

#######################################################
## Use NCEP.flight(), to simulate a flight without 
## querying the NCEP database.  In this case, we use
## wind conditions that depend on the animal's location ##

## First create a flow assistance function that will
## generate u and v flow components based on the animal's
## location
## Note that to use the datetime and the animal's location,
## the function MUST have the arguments lat.x, lon.x, and dt.x
Ex.FA <- function(direction, lat.x, lon.x, dt.x, airspeed){
    deg2rad = pi/180
    rad2deg = 180/pi
    ## Generate U and V flow component based on lat and lon
    u.x <- sin(lat.x*deg2rad) 
    v.x <- cos(lon.x*deg2rad)
    ## Apply NCEP.Tailwind with generated flow data
    return(cbind(NCEP.Tailwind(u=u.x, v=v.x,
        direction=direction, airspeed=airspeed), u.x, v.x))
    }

## Now use the function we just created in NCEP.flight
## The location and datetime are passed to the flow-
## assistance function automatically as lat.x, lon.x, and dt.x
tst3 <- NCEP.flight(beg.loc=c(58.00,7.00), end.loc=c(53.00,7.00), 
  begin.dt='2007-10-01 18:00:00', flow.assist='Ex.FA', 
  fa.args=list(airspeed=12), path='loxodrome',calibrate.dir=TRUE, 
  calibrate.alt=FALSE, cutoff=-10, when2stop='latitude',
  levels2consider=850, hours=12, evaluation.interval=60, 
  id=1, land.if.bad=FALSE, reanalysis2 = FALSE, query=FALSE)

## Confirm that the U and V wind components were determined
## by the latitude and longitude at each timestep
sin(tst3$lat[3] * (pi/180)) == tst3$u.x[3]
cos(tst3$lon[7] * (pi/180)) == tst3$v.x[7]




