library(ProbForecastGOP)


### Name: ProbForecastGOP-package
### Title: Probabilistic weather forecast using the GOP method
### Aliases: ProbForecastGOP-package ProbForecastGOP-package
### Keywords: package

### ** Examples

library(fields)
library(RandomFields)
data(slp)
day <-slp$date.obs
id <- slp$id.stat
coord1 <- slp$lon.stat
coord2 <- slp$lat.stat
obs <- slp$obs
forecast <-slp$forecast

data(gridlong)
coord1.grid <- gridlong$gridded.lon

data(gridlat)
coord2.grid <- gridlat$gridded.lat

data(forecast.grid)
forecast.grid <- forecast.grid$gridded.forecast

## Specified cutpoints, default values for all the other fields.
## Only empirical variogram computation
empirical.variog <- ProbForecastGOP(day=day,obs=obs,forecast=forecast,
id=id,coord1=coord1,coord2=coord2,cut.points=seq(0,1000,by=2),
max.dist=NULL,nbins=NULL,variog.model="exponential",max.dist.fit=NULL,
init.val=NULL,fix.nugget=FALSE,coord1.grid=coord1.grid,
coord2.grid=coord2.grid,forecast.grid=forecast.grid,n.sim=10,
out="VARIOG",n.displ=4,qt.displ=c(5,50,95))


## Unspecified cutpoints.
## Fit of a parametric variogram to an empirical variogram.
fitted.variog <- ProbForecastGOP(day=day,obs=obs,forecast=forecast,id=id,
coord1=coord1,coord2=coord2,cut.points=NULL,max.dist=NULL,nbins=NULL,
variog.model="exponential",max.dist.fit=NULL,init.val=NULL,fix.nugget=FALSE,
coord1.grid=coord1.grid,coord2.grid=coord2.grid,forecast.grid=forecast.grid,
n.sim=10,out="FIT",n.displ=4,qt.displ=c(5,50,95))


## Unspecified cutpoints. 
## Whole routine.
simulation.fields <- 
ProbForecastGOP(day=day,obs=obs,forecast=forecast,id=id,coord1=coord1,
coord2=coord2,cut.points=NULL,max.dist=NULL,nbins=NULL,variog.model=NULL,
max.dist.fit=NULL,init.val=NULL,fix.nugget=FALSE,coord1.grid=coord1.grid,
coord2.grid=coord2.grid,forecast.grid=forecast.grid,n.sim=4,out="SIM",
n.displ=4,qt.displ=c(5,50,95))



