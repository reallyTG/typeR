library(ramps)


### Name: georamps
### Title: Bayesian Geostatistical Model Fitting with RAMPS
### Aliases: georamps print.ramps
### Keywords: models

### ** Examples

## Not run: 
##D ## Load the included uranium datasets for use in this example
##D data(NURE)
##D 
##D ## Geostatistical analysis of areal measurements
##D NURE.ctrl1 <- ramps.control(
##D    iter = 25,
##D    beta = param(0, "flat"),
##D    sigma2.e = param(1, "invgamma", shape = 2.0, scale = 0.1, tuning = 0.75),
##D    phi = param(10, "uniform", min = 0, max = 35, tuning = 0.50),
##D    sigma2.z = param(1, "invgamma", shape = 2.0, scale = 0.1)
##D )
##D 
##D NURE.fit1 <- georamps(log(ppm) ~ 1,
##D    correlation = corRExp(form = ~ lon + lat, metric = "haversine"),
##D    weights = area,
##D    data = NURE,
##D    subset = (measurement == 1),
##D    aggregate = list(grid = NURE.grid, blockid = "id"),
##D    control = NURE.ctrl1
##D )
##D print(NURE.fit1)
##D summary(NURE.fit1)
##D 
##D 
##D ## Analysis of point-source measurements
##D NURE.ctrl2 <- ramps.control(
##D    iter = 25,
##D    beta = param(0, "flat"),
##D    sigma2.e = param(1, "invgamma", shape = 2.0, scale = 0.1, tuning = 0.75),
##D    phi = param(10, "uniform", min = 0, max = 35, tuning = 0.5),
##D    sigma2.z = param(1, "invgamma", shape = 2.0, scale = 0.1)
##D )
##D 
##D NURE.fit2 <- georamps(log(ppm) ~ 1,
##D    correlation = corRExp(form = ~ lon + lat, metric = "haversine"),
##D    data = NURE,
##D    subset = (measurement == 2),
##D    control = NURE.ctrl2
##D )
##D print(NURE.fit2)
##D summary(NURE.fit2)
##D 
##D 
##D ## Joint analysis of areal and point-source measurements with
##D ## prediction only at grid sites
##D NURE.ctrl <- ramps.control(
##D    iter = 25,
##D    beta = param(rep(0, 2), "flat"),
##D    sigma2.e = param(rep(1, 2), "invgamma", shape = 2.0, scale = 0.1, tuning = 0.75),
##D    phi = param(10, "uniform", min = 0, max = 35, tuning = 0.5),
##D    sigma2.z = param(1, "invgamma", shape = 2.0, scale = 0.1),
##D    z.monitor = NURE.grid
##D )
##D 
##D NURE.fit <- georamps(log(ppm) ~ factor(measurement) - 1,
##D    correlation = corRExp(form = ~ lon + lat, metric = "haversine"),
##D    variance = list(fixed = ~ measurement),
##D    weights = area * (measurement == 1) + (measurement == 2),
##D    data = NURE,
##D    aggregate = list(grid = NURE.grid, blockid = "id"),
##D    control = NURE.ctrl
##D )
##D print(NURE.fit)
##D summary(NURE.fit)
##D 
##D 
##D ## Discard initial 5 MCMC samples as a burn-in sequence
##D fit <- window(NURE.fit, iter = 6:25)
##D print(fit)
##D summary(fit)
##D 
##D ## Deviance Information Criterion
##D DIC(fit)
##D 
##D ## Prediction at unmeasured sites
##D ct <- map("state", "connecticut", plot = FALSE)
##D lon <- seq(min(ct$x, na.rm = TRUE), max(ct$x, na.rm = TRUE), length = 20)
##D lat <- seq(min(ct$y, na.rm = TRUE), max(ct$y, na.rm = TRUE), length = 15)
##D grid <- expand.grid(lon, lat)
##D 
##D newsites <- data.frame(lon = grid[,1], lat = grid[,2],
##D                        measurement = 1)
##D pred <- predict(fit, newsites)
##D 
##D plot(pred, func = function(x) exp(mean(x)),
##D      database = "state", regions = "connecticut",
##D      resolution = c(200, 150), bw = 5,
##D      main = "Posterior Mean",
##D      legend.args = list(text = "ppm", side = 3, line = 1))
##D 
##D plot(pred, func = function(x) exp(sd(x)),
##D      database = "state", regions = "connecticut",
##D      resolution = c(200, 150), bw = 5,
##D      main = "Posterior Standard Deviation",
##D      legend.args = list(text = "ppm", side = 3, line = 1))
## End(Not run)



