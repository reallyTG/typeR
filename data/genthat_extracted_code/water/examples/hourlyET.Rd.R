library(water)


### Name: hourlyET
### Title: Calculates ET using Penman Monteith hourly formula
### Aliases: hourlyET

### ** Examples

WeatherStation  <- data.frame(wind=4.72,
                              RH=59, 
                              temp=24.3,
                              radiation=675, 
                              height=2.2, 
                              lat=-35.37, 
                              long=71.5946, 
                              elev=124)
  hourlyET(WeatherStation, hours=10.5, DOY=363, long.z=71.635)



