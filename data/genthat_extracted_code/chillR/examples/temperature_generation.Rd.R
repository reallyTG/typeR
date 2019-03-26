library(chillR)


### Name: temperature_generation
### Title: Generation of synthetic temperature records
### Aliases: temperature_generation
### Keywords: utility

### ** Examples


Temp<-temperature_generation(KA_weather,years=c(1999,2001),
  sim_years = c(2001,2005),temperature_scenario = data.frame(Tmin=c(1,3,2,1,5,7,3,2,1,5,4,3),
  Tmax=c(1,2,3,2,1,3,2,1,2,3,4,5)))
  
Temp<-temperature_generation(weather=KA_weather,years=c(1999,2001),
  sim_years = c(2005,2010),
  temperature_scenario=data.frame(Tmin=c(1,3,5,8,12,15,15,15,10,8,3,1),
  Tmax=c(6,8,10,13,17,20,20,20,15,13,8,6)))

 



