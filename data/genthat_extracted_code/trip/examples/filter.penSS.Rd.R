library(trip)


### Name: filter.penSS
### Title: Non-destructive smoothing filter
### Aliases: filter.penSS
### Keywords: manip misc

### ** Examples



## Not run: 
##D ## Example takes a few minutes
##D 
##D ## Fake some data
##D 
##D ## Brownian motion tethered at each end
##D brownian.bridge <- function(n, r) {
##D   x <- cumsum(rnorm(n, 0, 1))
##D   x <- x - (x[1] + seq(0, 1, length=n) * (x[n] - x[1]))
##D   r * x
##D }
##D 
##D ## Number of days and number of obs
##D days <- 50
##D n <- 200
##D 
##D ## Make separation between obs gamma distributed
##D x <- rgamma(n, 3)
##D x <- cumsum(x)
##D x <- x/x[n]
##D 
##D ## Track is lissajous + brownian bridge
##D b.scale <- 0.6
##D r.scale <- sample(c(0.1, 2, 10.2), n, replace=TRUE,
##D                   prob=c(0.8, 0.18, 0.02))
##D set.seed(44)
##D 
##D tms <- ISOdate(2001, 1, 1) + trunc(days * 24 * 60 * 60 *x)
##D lon <- 120 + 20 * sin(2 * pi * x) +
##D     brownian.bridge(n, b.scale) + rnorm(n, 0, r.scale)
##D lat <- -40 + 10 *(sin(3 * 2 * pi * x) + cos(2 * pi * x) - 1) +
##D     brownian.bridge(n, b.scale) + rnorm(n, 0, r.scale)
##D 
##D tr <- new("trip",
##D           SpatialPointsDataFrame(cbind(lon, lat),
##D                                  data.frame(gmt=tms, id="lbb")),
##D                                  TimeOrderedRecords(c("gmt", "id")))
##D plot(tr)
##D 
##D ## the filtered version
##D trf <- filter.penSS(tr, lambda=1, iterlim=400, print.level=1)
##D 
##D lines(trf)
##D 
## End(Not run)





