library(geoGAM)


### Name: predict.geoGAM
### Title: Prediction from fitted geoGAM model
### Aliases: predict predict.default predict.geoGAM
### Keywords: spatial models & regression & nonlinear

### ** Examples


data(quakes)
set.seed(2)

quakes <- quakes[ ss <- sample(1:nrow(quakes), 50), ]

# Artificially split data to create prediction data set
quakes.pred <- quakes[ -ss, ]

quakes.geogam <- geoGAM(response = "mag",
                        covariates = c("depth", "stations"),
                        data = quakes,
                        max.stop = 5,
                        cores = 1)

predicted <- predict(quakes.geogam, newdata = quakes.pred, type = "response" )


## Not run: 
##D 
##D 
##D ## Use soil data set of soil mapping study area near Berne
##D 
##D library(raster)
##D 
##D data(berne)
##D data(berne.grid)
##D 
##D # Split data sets and
##D # remove rows with missing values in response and covariates
##D 
##D d.cal <- berne[ berne$dataset == "calibration" & complete.cases(berne), ]
##D 
##D ### Model selection for binary response
##D ph10.geogam <- geoGAM(response = "ph.0.10",
##D                              covariates = names(d.cal)[14:ncol(d.cal)],
##D                              coords = c("x", "y"),
##D                              data = d.cal,
##D                              seed = 1)
##D 
##D # Create GRID output with predictions
##D sp.grid <- berne.grid[, c("x", "y")]
##D 
##D sp.grid$pred.ph.0.10 <- predict(ph10.geogam, newdata = berne.grid)
##D 
##D # transform to sp object
##D coordinates(sp.grid) <- ~ x + y
##D 
##D # assign Swiss CH1903 / LV03 projection
##D proj4string(sp.grid) <- CRS("+init=epsg:21781")
##D 
##D # transform to grid
##D gridded(sp.grid) <- TRUE
##D 
##D plot(sp.grid)
##D 
##D # optionally save result to GeoTiff
##D # writeRaster(raster(sp.grid, layer = "pred.ph.0.10"),
##D #             filename= "raspH10.tif", datatype = "FLT4S", format ="GTiff")
##D 
## End(Not run)





