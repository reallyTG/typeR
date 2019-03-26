
# analyze the averaged jason3 wind speed data
library("GpGp")

# loads in object
data(jason3)
head(jason3)
lat       <- jason3$lat
lon       <- jason3$lon
windspeed <- jason3$windspeed
time      <- jason3$time
n         <- length(windspeed)

# plot of data from first 6 hours
inds <- time < 6*3600
fields::quilt.plot(lon[inds],lat[inds],windspeed[inds],nx=400,ny=200)

# plot of data from first day
inds <- time < 24*3600
fields::quilt.plot(lon[inds],lat[inds],windspeed[inds],nx=400,ny=200)

# plot of all data
fields::quilt.plot(lon,lat,windspeed,nx=400,ny=200)

# longitude latitude locations
locs <- cbind(lon,lat)
locstime <- cbind(locs,time)

# design matrix for constant mean
X <- as.matrix( rep(1,length(windspeed)) )

# fit the model
inds <- round( seq(1,n,length.out = round(n/8)) )  # set to 1:n to fit to full dataset
system.time( fit_space     <- fit_model(windspeed[inds], locs[inds,], X[inds,], "matern_sphere") )
system.time( fit_spacetime <- fit_model(windspeed[inds], locstime[inds,], X[inds,], "matern_sphere_time") )

# make predictions at a middle time point

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
pred_array <- array( pred, c(length(longrid),length(latgrid)) )
fields::image.plot(longrid,latgrid,pred_array)

# conditional simulations
sim <- cond_sim(fit_spacetime$covparms, "matern_sphere_time", windspeed,
    locstime, locstime_pred, X, X_pred, fit_spacetime$beta, nsims = 2, m = 40)

# plot conditional simulations
par(mfrow=c(1,2))
sim_array <- array( sim[,1], c(length(longrid),length(latgrid)) )
fields::image.plot(longrid,latgrid,sim_array)
sim_array <- array( sim[,2], c(length(longrid),length(latgrid)) )
fields::image.plot(longrid,latgrid,sim_array)









# fit model does a lot for us. Below is a "manual" analysis,
# going through each step

# get ordering and reorder 
ord <- order_maxmin(locs, lonlat = TRUE)
plot(locs[ord[1:500],1],locs[ord[1:500],2],pch=16,cex=1/2)

# reorder
locsord <- locs[ord,]
locstimeord <- locstime[ord,]
windspeedord <- windspeed[ord]
Xord <- as.matrix( X[ord,] )

# get nearest neighbors
NNarray <- find_ordered_nn(locsord,m=30, lonlat = TRUE)
NNlist <- group_obs(NNarray)


# fit3 and fit4 are the same as above, except
# profile out mean and variance parameters for faster fitting

# ignoring temporal dimension
funtomax1 <- function( logparms ){
    parms <- exp(logparms)
    loglik <- proflik_mean_variance_grouped(parms,"matern_sphere",windspeedord,
                                  Xord,cbind(lon[ord],lat[ord]),NNlist)
    return(-loglik)
}
startparms <- c(0.2,0.8,0.001)

# just run for 10 iterations for demonstration
# run for more iterations to get parameter estimates
fit1 <- optim(log(startparms),funtomax1,control=list(trace=5,maxit=10))
fit1$value
fit_space <- proflik_mean_variance_grouped(exp(fit1$par),"matern_sphere",windspeedord,
                               Xord,cbind(lon[ord],lat[ord]),NNlist,return_parms = TRUE)

# with temporal dimension
funtomax2 <- function( logparms ){
    parms <- exp(logparms)
    parms[3] = min(parms[3],4)
    loglik <- proflik_mean_variance(parms,"matern_sphere_time",windspeedord,
                                    Xord,cbind(lon[ord],lat[ord],time[ord]),NNarray)
    return(-loglik)
}
startparms <- c(0.1,6e4,0.8,0.001)

# just run for 10 iterations for demonstration
# run for more iterations to get parameter estimates
system.time( fit2 <- optim(log(startparms),funtomax2,control=list(trace=5,maxit=10)) )
fit2$value
fit_spacetime <- proflik_mean_variance(exp(fit2$par),"matern_sphere_time",windspeedord,
                               Xord,cbind(lon[ord],lat[ord],time[ord]),NNarray,return_parms = TRUE)

fit_space
fit_spacetime


#  Predictions  #

# get prediction locations
mediantime <- median(time)
latgrid <- seq( min(lat), max(lat), length.out = 60 )
longrid <- seq( 0, 360, length.out = 121)[1:120] # so no locations repeated
locs_pred <- as.matrix( expand.grid(longrid,latgrid) )
n_pred <- nrow(locs_pred)
locstime_pred <- cbind( locs_pred, rep(mediantime, n_pred) )

# reorder prediction locations
ord_pred <- order_maxmin( locs_pred, lonlat = TRUE )
locstimeord_pred <- locstime_pred[ord_pred,]
Xord_pred <- as.matrix( rep(1,n_pred) )

pred_ord <- predictions(fit_spacetime$covparms, "matern_sphere_time", 
    locstimeord, locstimeord_pred, Xord, Xord_pred, fit_spacetime$beta, windspeedord, 
    m = 50, lonlat = TRUE, reorder = FALSE )

# undo the ordering
pred <- rep(NA,length(pred_ord))
pred[ord_pred] <- pred_ord
pred_array <- array( pred, c(length(longrid),length(latgrid)) )
fields::image.plot(pred_array)


