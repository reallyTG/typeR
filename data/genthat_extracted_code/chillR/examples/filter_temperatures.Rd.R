library(chillR)


### Name: filter_temperatures
### Title: Quality filter for temperature records
### Aliases: filter_temperatures
### Keywords: utility

### ** Examples



weather<-fix_weather(KA_weather[which(KA_weather$Year>2009),])

hourtemps<-stack_hourly_temps(weather, latitude=50.4)

filtered<-filter_temperatures(hourtemps$hourtemps,remove_value=-99,
  running_mean_filter=3)




