library(geoGAM)


### Name: bootstrap.geoGAM
### Title: Bootstrapped predictive distribution
### Aliases: bootstrap.geoGAM bootstrap bootstrap.default
### Keywords: spatial models & regression & nonlinear

### ** Examples


## Not run: 
##D data(quakes)
##D 
##D # group stations to ensure min 20 observations per factor level
##D # and reduce number of levels for speed
##D quakes$stations <- factor( cut( quakes$stations, breaks = c(0,15,19,23,30,39,132)) )
##D 
##D # Artificially split data to create prediction data set
##D set.seed(1)
##D quakes.pred <- quakes[ ss <- sample(1:nrow(quakes), 500), ]
##D quakes <- quakes[ -ss, ]
##D 
##D quakes.geogam <- geoGAM(response = "mag",
##D                         covariates = c("stations", "depth"),
##D                         coords = c("lat", "long"),
##D                         data = quakes,
##D                         max.stop = 20)
##D 
##D 
##D ## compute model based bootstrap with 100 repetitions
##D quakes.boot <- bootstrap(quakes.geogam,
##D                          newdata = quakes.pred,
##D                          R = 100)
##D 
##D 
##D # plot predictive distribution for site in row 9
##D hist( as.numeric( quakes.boot[ 9, -c(1:2)] ), col = "grey",
##D       main = paste("Predictive distribution at", paste( quakes.boot[9, 1:2], collapse = "/" )),
##D       xlab = "predicted magnitude")
##D 
##D # compute 95 % prediction interval and add to plot
##D quant95 <- quantile( as.numeric( quakes.boot[ 9, -c(1:2)] ), probs = c(0.025, 0.975) )
##D abline(v = quant95[1], lty = "dashed")
##D abline(v = quant95[2], lty = "dashed")
## End(Not run)



