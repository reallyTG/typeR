library(overlap)


### Name: Simulated data
### Title: Simulated data for diurnal activity patterns
### Aliases: simulatedData tigerObs tigerTrue pigObs pigTrue
### Keywords: datasets

### ** Examples

data(simulatedData)

xx <- seq(0, 2*pi, length=128)
plot(xx, tigerTrue, type='l') # True density from which sample was drawn
rug(tigerObs)




