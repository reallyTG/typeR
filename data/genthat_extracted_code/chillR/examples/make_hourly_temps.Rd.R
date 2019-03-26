library(chillR)


### Name: make_hourly_temps
### Title: Make hourly temperature record from daily data
### Aliases: make_hourly_temps
### Keywords: utility

### ** Examples


weather<-fix_weather(KA_weather)

THourly<-make_hourly_temps(50.4,weather$weather)

#in most cases, you're probably better served by stack_hour_temperatures




