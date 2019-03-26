library(CalSim)


### Name: calibration_simplex
### Title: Calibration Simplex
### Aliases: calibration_simplex CalSim calibration_simplex.default

### ** Examples

#install.packages("scoring") #if this package is not installed already
data("WeatherProbs", package = "scoring")

#Calibration Simplex for Temprature Forecasts
cst = calibration_simplex(p_a = WeatherProbs$tabv,
                          p_b = WeatherProbs$tblw,
                          obs=WeatherProbs$tcat)
plot(cst)
plot(cst,error_scale=1)

#Calibration Simplex for Precipitation Forecasts
csp = calibration_simplex(n=19,
                          p_a = WeatherProbs$pabv,
                          p_b = WeatherProbs$pblw,
                          obs=WeatherProbs$pcat)
plot(csp)
plot(csp,error_scale=1)

#Both forecasts are very(!) underconfident. This seems like an unrealistic example!




