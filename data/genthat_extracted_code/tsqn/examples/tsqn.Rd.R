library(tsqn)


### Name: TimeSeriesQn
### Title: Applications of the Qn estimator to time series (univariate and
###   multivariate)
### Aliases: tsqn

### ** Examples

x <- rnorm(1000,10,1)
y <- rnorm(1000,100,10)
xy <- cbind(x,y)

covQn(x,y)
corQn(x,y)
covMatQn(xy)
corMatQn(xy)


robacf(x)

dataset <- cbind(fdeaths,mdeaths)
robacf(dataset)
robacf(dataset,type="covariance",lag.max=10)

PerQn(ldeaths)

library(fracdiff)
simseries <- fracdiff.sim(1500, d = 0.3)
GPH_estimate(simseries$series,method="GPH")$d
GPH_estimate(simseries$series,method="GPH-Qn")$d




