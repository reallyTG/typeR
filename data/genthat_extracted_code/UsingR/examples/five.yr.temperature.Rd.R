library(UsingR)


### Name: five.yr.temperature
### Title: Five years of weather in New York City
### Aliases: five.yr.temperature
### Keywords: datasets

### ** Examples

data(five.yr.temperature)
attach(five.yr.temperature)
scatter.smooth(temps ~ days,col=gray(.75))
lines(smooth.spline(temps ~ days), lty=2)
lines(supsmu(days, temps), lty=3)



