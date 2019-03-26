## ----echo = FALSE--------------------------------------------------------
library(weathermetrics)

## ------------------------------------------------------------------------
#Convert from degrees Celsius to degress Fahrenheit
data(lyon)
lyon$TemperatureF <- convert_temperature(lyon$TemperatureC,
   old_metric = "celsius", new_metric = "fahrenheit")
lyon$DewpointF <- convert_temperature(lyon$DewpointC, 
   old_metric = "celsius", new_metric = "fahrenheit")
lyon
#Convert from degrees Fahrenheit to degrees Celsius
data(norfolk)
norfolk$TemperatureC <- convert_temperature(norfolk$TemperatureF,
   old_metric = "f", new_metric = "c")
norfolk$DewpointC <- convert_temperature(norfolk$DewpointF, 
   old_metric = "f", new_metric = "c")
norfolk
#Convert from degrees Kelvin to degrees Celsius
data(angeles)
angeles$TemperatureC <- convert_temperature(angeles$TemperatureK,
   old_metric = "kelvin", new_metric = "celsius")
angeles$DewpointC <- convert_temperature(angeles$DewpointK, 
   old_metric = "kelvin", new_metric = "celsius")
angeles

## ------------------------------------------------------------------------
data(lyon)
lyon$RH <- dewpoint.to.humidity(t = lyon$TemperatureC,
                                dp = lyon$DewpointC,
                                temperature.metric = "celsius")
lyon

## ------------------------------------------------------------------------
data(newhaven)
newhaven$DP <- humidity.to.dewpoint(t = newhaven$TemperatureF,
                                    rh = newhaven$Relative.Humidity,
                                    temperature.metric = "fahrenheit")
newhaven

## ------------------------------------------------------------------------
data(newhaven)
newhaven$DP <- humidity.to.dewpoint(t = newhaven$TemperatureF,
                                    rh = newhaven$Relative.Humidity,
                                    temperature.metric = "fahrenheit")
newhaven$DP_C <- convert_temperature(newhaven$DP, old_metric = "f", new_metric = "c")
newhaven

## ------------------------------------------------------------------------
data(suffolk)
suffolk$HI <- heat.index(t = suffolk$TemperatureF,
                         rh = suffolk$Relative.Humidity,
                         temperature.metric = "fahrenheit",
                         output.metric = "fahrenheit")
suffolk

## ------------------------------------------------------------------------
data(lyon)
lyon$HI_F <- heat.index(t = lyon$TemperatureC,
                      dp = lyon$DewpointC,
                      temperature.metric = "celsius",
                      output.metric = "fahrenheit")
lyon

## ------------------------------------------------------------------------
data(beijing)
beijing$knots <- convert_wind_speed(beijing$kmph,
   old_metric = "kmph", new_metric = "knots")
beijing

data(foco)
foco$mph <- convert_wind_speed(foco$knots, old_metric = "knots",
   new_metric = "mph", round = 0)
foco$mph <- convert_wind_speed(foco$knots, old_metric = "knots",
   new_metric = "mps", round = NULL)
foco$kmph <- convert_wind_speed(foco$mph, old_metric = "mph",
   new_metric = "kmph")
foco

## ------------------------------------------------------------------------
data(breck)
breck$Precip.mm <- convert_precip(breck$Precip.in,
   old_metric = "inches", new_metric = "mm", round = 2)
breck

data(loveland)
loveland$Precip.in <- convert_precip(loveland$Precip.mm,
   old_metric = "mm", new_metric = "inches", round = NULL)
loveland$Precip.cm <- convert_precip(loveland$Precip.mm,
   old_metric = "mm", new_metric = "cm", round = 3)
loveland

## ------------------------------------------------------------------------
df <- data.frame(T = c(NA, 90, 85),
                 DP = c(80, NA, 70))
df$RH <- dewpoint.to.humidity(t = df$T, dp = df$DP,
                              temperature.metric = "fahrenheit")
df

## ------------------------------------------------------------------------
df <- data.frame(T = c(90, 90, 85),
                 DP = c(80, 95, 70))
df$heat.index <- heat.index(t = df$T, dp = df$DP,
                            temperature.metric = 'fahrenheit')
df

## ------------------------------------------------------------------------
data(suffolk)
suffolk$TempC <- convert_temperature(suffolk$TemperatureF,
                                     old_metric = "f",
                                     new_metric = "c",
                                     round = 5)
suffolk$HI <- heat.index(t = suffolk$TemperatureF, 
                         rh = suffolk$Relative.Humidity,
                         round = 3)
suffolk

