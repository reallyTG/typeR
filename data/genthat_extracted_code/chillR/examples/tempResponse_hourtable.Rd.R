library(chillR)


### Name: tempResponse_hourtable
### Title: Add metric accumulation to table of hourly temperatures
### Aliases: tempResponse_hourtable
### Keywords: and calculation chill heat

### ** Examples


weather<-fix_weather(KA_weather[which(KA_weather$Year>2008),])

hourtemps<-stack_hourly_temps(weather,latitude=50.4)

cht<-chilling_hourtable(hourtemps,20)




