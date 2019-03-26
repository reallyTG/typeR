library(ggfortify)


### Name: autoplot.acf
### Title: Autoplot 'stats::acf'. Note to pass 'plot = FALSE' to original
###   function to suppress standard plot output
### Aliases: autoplot.acf

### ** Examples

autoplot(stats::acf(AirPassengers, plot = FALSE))
autoplot(stats::pacf(AirPassengers, plot = FALSE))
autoplot(stats::ccf(AirPassengers, AirPassengers, plot = FALSE))



