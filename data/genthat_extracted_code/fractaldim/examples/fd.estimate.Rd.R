library(fractaldim)


### Name: fd.estimate
### Title: Estimating Fractal Dimensions of Time Series and Two-dimensional
###   Data
### Aliases: fd.estimate FractalDim fd.estimate.matrix fd.estimate.numeric
###   fd.estimate.data.frame
### Keywords: ts spatial

### ** Examples

## Not run: 
##D library(RandomFields)
##D n <- 10000
##D # generate a time series
##D rf <- GaussRF(x = c(0, 1, 1/n), model = "stable", 
##D        grid = TRUE, gridtriple = TRUE,
##D        param = c(mean=0, variance=1, nugget=0, scale=100, kappa=1))
##D 
##D # Plots for two sliding windows of each of the four methods below.
##D # Argument nlags is common to all methods;
##D # the 'variation' method has in addition argument p.index
##D par(mfrow=c(2,4)) # one row per window
##D fd <- fd.estimate(rf, 
##D        methods = list(list(name="variation", p.index=0.5), 
##D        					"variogram", "hallwood", "boxcount"),
##D        window.size = 5000, step.size = 5000, plot.loglog = TRUE, nlags = 10)
##D     
##D # 2d random fields
##D n <- 200
##D rf2d <- GaussRF(x = c(0,1, 1/n), y = c(0,1, 1/n), model = "stable", 
##D          grid = TRUE, gridtriple = TRUE,
##D          param = c(mean=0, variance=1, nugget=0, scale=1, kappa=1))
##D par(mfrow=c(2,2))
##D # plots for 4 sliding windows (2 horizontal, 2 vertical)
##D fd2d <- fd.estimate(rf2d, methods="filter1",
##D          window.size = 100, step.size=100, plot.loglog = TRUE)
## End(Not run)



