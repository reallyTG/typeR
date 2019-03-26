## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library("GpGp")
data(jason3)
head(jason3)
lat       <- jason3$lat
lon       <- jason3$lon
windspeed <- jason3$windspeed
time      <- jason3$time
n         <- length(windspeed)

## ---- fig.width=8, fig.height=4------------------------------------------
# plot of data from first 6 hours
par(mar=c(4,4,1,1))
inds <- time < 6*3600
fields::quilt.plot(lon[inds],lat[inds],windspeed[inds],
    nx=400,ny=200,xlab="Lon",ylab="Lat",legend.lab = "windspeed (m/s)")
# plot of data from first day
inds <- time < 24*3600
fields::quilt.plot(lon[inds],lat[inds],windspeed[inds],
    nx=400,ny=200,xlab="Lon",ylab="Lat",legend.lab = "windspeed (m/s)")
# plot of all data
fields::quilt.plot(lon,lat,windspeed,
    nx=400,ny=200,xlab="Lon",ylab="Lat",legend.lab = "windspeed (m/s)")

## ------------------------------------------------------------------------
# longitude latitude locations, space-time locations, and design matrix
locs <- cbind(lon,lat)
locstime <- cbind(locs,time)
X <- as.matrix( rep(1,length(windspeed)) )

## ------------------------------------------------------------------------
# fit to a subset of the data (for faster CRAN checks)
# use 'inds <- 1:n' to fit to full dataset
inds <- round( seq(1,n,length.out = 1500) ) 
fit_space     <- fit_model(windspeed[inds], locs[inds,], X[inds,], "matern_sphere")
fit_spacetime <- fit_model(windspeed[inds], locstime[inds,], X[inds,], "matern_sphere_time")
fit_space
fit_spacetime

## ---- fig.width=8, fig.height=4------------------------------------------
# prediction locations and design matrix
mediantime <- median(time)
latgrid <- seq( min(lat), max(lat), length.out = 60 )
longrid <- seq( 0, 360, length.out = 121)[1:120] # so no locations repeated
locs_pred <- as.matrix( expand.grid(longrid,latgrid) )
n_pred <- nrow(locs_pred)
locstime_pred <- cbind( locs_pred, rep(mediantime, n_pred) )
X_pred <- as.matrix( rep(1,n_pred) )
# predictions
pred <- predictions(fit_spacetime$covparms, "matern_sphere_time", windspeed,
    locstime, locstime_pred, X, X_pred, fit_spacetime$beta, m = 40)
# plot predictions
par(mar=c(4,4,1,1))
pred_array <- array( pred, c(length(longrid),length(latgrid)) )
fields::image.plot(longrid,latgrid,pred_array)
# conditional simulations
sim <- cond_sim(fit_spacetime$covparms, "matern_sphere_time", windspeed,
    locstime, locstime_pred, X, X_pred, fit_spacetime$beta, m = 40)
# plot conditional simulations
sim_array <- array( sim, c(length(longrid),length(latgrid)) )
fields::image.plot(longrid,latgrid,sim_array)

