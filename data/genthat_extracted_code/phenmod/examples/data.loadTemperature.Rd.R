library(phenmod)


### Name: data.loadTemperature
### Title: Loads a temperature vector
### Aliases: data.loadTemperature

### ** Examples

  t.year <- as.matrix(rnorm(365, mean=10, sd=5))
  t.p.year <- as.matrix(rnorm(365, mean=9, sd=6))
  temperatures <- data.loadTemperature(year=2006,temperature.year=t.year, 
			temperature.previous.year=t.p.year, 
			from.previous.year.doy=210, length=365, 
			position=1, scale.factor=0.1)



