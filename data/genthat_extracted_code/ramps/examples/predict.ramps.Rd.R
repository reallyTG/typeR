library(ramps)


### Name: predict.ramps
### Title: Prediction Method for georamps Model Fits
### Aliases: predict.ramps
### Keywords: models

### ** Examples

## Prediction for georamps example results

## Not run: 
##D ct <- map("state", "connecticut", plot = FALSE)
##D lon <- seq(min(ct$x, na.rm = TRUE), max(ct$x, na.rm = TRUE), length = 20)
##D lat <- seq(min(ct$y, na.rm = TRUE), max(ct$y, na.rm = TRUE), length = 15)
##D grid <- expand.grid(lon, lat)
##D 
##D newsites <- data.frame(lon = grid[,1], lat = grid[,2],
##D                        measurement = 1)
##D NURE.pred <- predict(NURE.fit, newsites)
##D 
##D par(mfrow=c(2,1))
##D plot(NURE.pred, func = function(x) exp(mean(x)),
##D      database = "state", regions = "connecticut",
##D      resolution = c(200, 150), bw = 5,
##D      main = "Posterior Mean",
##D      legend.args = list(text = "ppm", side = 3, line = 1))
##D plot(NURE.pred, func = function(x) exp(sd(x)),
##D      database = "state", regions = "connecticut",
##D      resolution = c(200, 150), bw = 5,
##D      main = "Posterior Standard Deviation",
##D      legend.args = list(text = "ppm", side = 3, line = 1))
## End(Not run)



