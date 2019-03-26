library(fractal)


### Name: FNN
### Title: Estimation of the proper embedding dimension for a
###   single-variable time series
### Aliases: FNN plot.FNN print.FNN
### Keywords: univar models nonlinear

### ** Examples

## perform False Nearest Neighbors tests on 
## chaotic beam data for embedding dimensions 1 
## through 10, using a time delay embedding 
## with a time lag of 10 and an orbital lag of 
## 15 
x <- FNN(beamchaos, tlag=10, olag=15 )

## print the results 
print(x)

## plot the results 
plot(x)



