library(smooth)


### Name: gsi
### Title: Vector exponential smoothing model with Group Seasonal Indices
### Aliases: gsi
### Keywords: models multivariate nonlinear regression ts

### ** Examples


initialSeason <- runif(12,-1,1)
Y <- sim.ves("AAA", obs=120, nSeries=2, frequency=12, initial=c(10,0),
             initialSeason=initialSeason-mean(initialSeason),
             persistence=c(0.06,0.05,0.2), mean=0, sd=0.03)
Y$data <- exp(Y$data)

# The simplest model applied to the data with the default values
gsi(Y, h=10, holdout=TRUE, interval="u")

# An example with MASS package and correlated errors
## Not run: library(MASS)
## Not run: 
##D Y <- sim.ves("AAA", obs=120, nSeries=2, frequency=12,
##D          initial=c(5,0), initialSeason=initialSeason-mean(initialSeason),
##D          persistence=c(0.02,0.01,0.1), randomizer="mvrnorm", mu=c(0,0),
##D          Sigma=matrix(c(0.2,0.1,0.1,0.1),2,2))
## End(Not run)
## Not run: Y$data <- exp(Y$data)
## Not run: gsi(Y, h=10, holdout=TRUE, interval="u", silent=FALSE)




