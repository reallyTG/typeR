library(ggfortify)


### Name: fortify.acf
### Title: Convert 'stats::acf' to 'data.frame'
### Aliases: fortify.acf

### ** Examples

fortify(stats::acf(AirPassengers))
fortify(stats::pacf(AirPassengers))
fortify(stats::ccf(AirPassengers, AirPassengers))

fortify(stats::acf(AirPassengers), conf.int = TRUE)



