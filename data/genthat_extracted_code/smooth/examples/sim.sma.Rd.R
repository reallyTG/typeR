library(smooth)


### Name: sim.sma
### Title: Simulate Simple Moving Average
### Aliases: sim.sma
### Keywords: models nonlinear regression smooth ts univar

### ** Examples


# Create 40 observations of quarterly data using AAA model with errors from normal distribution
sma10 <- sim.sma(order=10,frequency=4,obs=40,randomizer="rnorm",mean=0,sd=100)




