library(artfima)


### Name: artsim
### Title: Simulation of stationary ARTFIMA
### Aliases: artsim
### Keywords: ts datagen

### ** Examples

z <- artsim(5000, d=5/6, lambda=0.045)
var(z)
artfimaTACVF(d=5/6, lambda=0.045, maxlag=1)[1]



