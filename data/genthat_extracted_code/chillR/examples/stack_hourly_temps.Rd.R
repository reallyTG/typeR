library(chillR)


### Name: stack_hourly_temps
### Title: Stacking of hourly temperatures
### Aliases: stack_hourly_temps
### Keywords: utility

### ** Examples



weather<-fix_weather(KA_weather[which(KA_weather$Year>2004),])

hourtemps<-stack_hourly_temps(weather, latitude=50.4)






