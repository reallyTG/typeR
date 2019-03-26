library(smooth)


### Name: sim.ssarima
### Title: Simulate SSARIMA
### Aliases: sim.ssarima
### Keywords: models nonlinear regression smooth ts univar

### ** Examples


# Create 120 observations from ARIMA(1,1,1) with drift. Generate 100 time series of this kind.
x <- sim.ssarima(ar.orders=1,i.orders=1,ma.orders=1,obs=120,nsim=100,constant=TRUE)

# Generate similar thing for seasonal series of SARIMA(1,1,1)(0,0,2)_4
x <- sim.ssarima(ar.orders=c(1,0),i.orders=c(1,0),ma.orders=c(1,2),lags=c(1,4),
                 frequency=4,obs=80,nsim=100,constant=FALSE)

# Generate 10 series of high frequency data from SARIMA(1,0,2)_1(0,1,1)_7(1,0,1)_30
x <- sim.ssarima(ar.orders=c(1,0,1),i.orders=c(0,1,0),ma.orders=c(2,1,1),lags=c(1,7,30),
                 obs=360,nsim=10)





