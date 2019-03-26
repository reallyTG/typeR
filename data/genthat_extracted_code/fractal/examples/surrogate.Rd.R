library(fractal)


### Name: surrogate
### Title: Surrogate data generation
### Aliases: surrogate eda.plot.surrogate plot.surrogate print.surrogate
### Keywords: datagen

### ** Examples

## create surrogate data sets using circulant 
## embedding method 
surr <- surrogate(beamchaos, method="ce")

## print the result 
print(surr)

## plot and compare various statistics of the 
## surrogate and original time series 
plot(surr, type="time")
plot(surr, type="sdf")
plot(surr, type="lag")
plot(surr, type="pdf")

## create comparison time history 
plot(surr, show="both", type="time")



