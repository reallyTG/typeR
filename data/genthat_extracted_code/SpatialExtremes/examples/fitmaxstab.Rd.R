library(SpatialExtremes)


### Name: fitmaxstab
### Title: Fits a max-stable process to data
### Aliases: fitmaxstab
### Keywords: htest

### ** Examples

## Not run: 
##D ##Define the coordinate of each location
##D n.site <- 30
##D locations <- matrix(runif(2*n.site, 0, 10), ncol = 2)
##D colnames(locations) <- c("lon", "lat")
##D 
##D ##Simulate a max-stable process - with unit Frechet margins
##D data <- rmaxstab(40, locations, cov.mod = "whitmat", nugget = 0, range = 3,
##D smooth = 0.5)
##D 
##D ##Now define the spatial model for the GEV parameters
##D param.loc <- -10 + 2 * locations[,2]
##D param.scale <- 5 + 2 * locations[,1] + locations[,2]^2
##D param.shape <- rep(0.2, n.site)
##D 
##D ##Transform the unit Frechet margins to GEV
##D for (i in 1:n.site)
##D   data[,i] <- frech2gev(data[,i], param.loc[i], param.scale[i],
##D param.shape[i])
##D 
##D ##Define a model for the GEV margins to be fitted
##D ##shape ~ 1 stands for the GEV shape parameter is constant
##D ##over the region
##D loc.form <- loc ~ lat
##D scale.form <- scale ~ lon + I(lat^2)
##D shape.form <- shape ~ 1
##D 
##D ##Fit a max-stable process using the Schlather's model
##D fitmaxstab(data, locations, "whitmat", loc.form, scale.form,
##D            shape.form)
##D 
##D ## Model without any spatial structure for the GEV parameters
##D ## Be careful this could be *REALLY* time consuming
##D fitmaxstab(data, locations, "whitmat")
##D 
##D ##  Fixing the smooth parameter of the Whittle-Matern family
##D ##  to 0.5 - e.g. considering exponential family. We suppose the data
##D ##  are unit Frechet here.
##D fitmaxstab(data, locations, "whitmat", smooth = 0.5, fit.marge = FALSE)
##D 
##D ##  Fitting a penalized smoothing splines for the margins with the
##D ##     Smith's model
##D data <- rmaxstab(40, locations, cov.mod = "gauss", cov11 = 100, cov12 =
##D                  25, cov22 = 220)
##D 
##D ##     And transform it to ordinary GEV margins with a non-linear
##D ##     function
##D fun <- function(x)
##D   2 * sin(pi * x / 4) + 10
##D fun2 <- function(x)
##D   (fun(x) - 7 ) / 15
##D 
##D param.loc <- fun(locations[,2])
##D param.scale <- fun(locations[,2])
##D param.shape <- fun2(locations[,1])
##D 
##D ##Transformation from unit Frechet to common GEV margins
##D for (i in 1:n.site)
##D   data[,i] <- frech2gev(data[,i], param.loc[i], param.scale[i],
##D param.shape[i])
##D 
##D ##Defining the knots, penalty, degree for the splines
##D n.knots <- 5
##D knots <- quantile(locations[,2], prob = 1:n.knots/(n.knots+1))
##D knots2 <- quantile(locations[,1], prob = 1:n.knots/(n.knots+1))
##D 
##D ##Be careful the choice of the penalty (i.e. the smoothing parameter)
##D ##may strongly affect the result Here we use p-splines for each GEV
##D ##parameter - so it's really CPU demanding but one can use 1 p-spline
##D ##and 2 linear models.
##D ##A simple linear model will be clearly faster...
##D loc.form <- y ~ rb(lat, knots = knots, degree = 3, penalty = .5)
##D scale.form <- y ~ rb(lat, knots = knots, degree = 3, penalty = .5)
##D shape.form <- y ~ rb(lon, knots = knots2, degree = 3, penalty = .5)
##D 
##D fitted <- fitmaxstab(data, locations, "gauss", loc.form, scale.form, shape.form,
##D                      control = list(ndeps = rep(1e-6, 24), trace = 10),
##D                      method = "BFGS")
##D fitted
##D op <- par(mfrow=c(1,3))
##D plot(locations[,2], param.loc, col = 2, ylim = c(7, 14),
##D      ylab = "location parameter", xlab = "latitude")
##D plot(fun, from = 0, to = 10, add = TRUE, col = 2)
##D points(locations[,2], predict(fitted)[,"loc"], col = "blue", pch = 5)
##D new.data <- cbind(lon = seq(0, 10, length = 100), lat = seq(0, 10, length = 100))
##D lines(new.data[,1], predict(fitted, new.data)[,"loc"], col = "blue")
##D legend("topleft", c("true values", "predict. values", "true curve", "predict. curve"),
##D        col = c("red", "blue", "red", "blue"), pch = c(1, 5, NA, NA), inset = 0.05,
##D        lty = c(0, 0, 1, 1), ncol = 2)
##D 
##D plot(locations[,2], param.scale, col = 2, ylim = c(7, 14),
##D      ylab = "scale parameter", xlab = "latitude")
##D plot(fun, from = 0, to = 10, add = TRUE, col = 2)
##D points(locations[,2], predict(fitted)[,"scale"], col = "blue", pch = 5)
##D lines(new.data[,1], predict(fitted, new.data)[,"scale"], col = "blue")
##D legend("topleft", c("true values", "predict. values", "true curve", "predict. curve"),
##D        col = c("red", "blue", "red", "blue"), pch = c(1, 5, NA, NA), inset = 0.05,
##D        lty = c(0, 0, 1, 1), ncol = 2)
##D 
##D plot(locations[,1], param.shape, col = 2,
##D      ylab = "shape parameter", xlab = "longitude")
##D plot(fun2, from = 0, to = 10, add = TRUE, col = 2)
##D points(locations[,1], predict(fitted)[,"shape"], col = "blue", pch = 5)
##D lines(new.data[,1], predict(fitted, new.data)[,"shape"], col = "blue")
##D legend("topleft", c("true values", "predict. values", "true curve", "predict. curve"),
##D        col = c("red", "blue", "red", "blue"), pch = c(1, 5, NA, NA), inset = 0.05,
##D        lty = c(0, 0, 1, 1), ncol = 2)
##D par(op)
## End(Not run)



