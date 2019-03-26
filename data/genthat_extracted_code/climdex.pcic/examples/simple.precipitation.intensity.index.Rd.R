library(climdex.pcic)


### Name: simple.precipitation.intensity.index
### Title: Simple Precipitation Intensity Index
### Aliases: simple.precipitation.intensity.index
### Keywords: climate ts

### ** Examples


prec.dat <- c(0.1, 3.0, 4.3, 0.9, 1.3, 6.0, 0, 0, 4.0, 1)
phony.date.factor <- factor(rep(1:2, each=5))
sdii <- simple.precipitation.intensity.index(prec.dat, phony.date.factor)




