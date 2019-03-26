library(fractal)


### Name: FNS
### Title: Estimation of the proper embedding dimension for a
###   single-variable time series
### Aliases: FNS
### Keywords: univar models nonlinear

### ** Examples

## perform False Nearest Strands tests on chaotic 
## beam data for embedding dimensions 1 through 
## 10, using a time delay embedding with a time 
## lag of 10 and an orbital lag of 15 
x <- FNS(beamchaos, dim=10, tlag=10, olag=15)

## print the results 
print(x)



