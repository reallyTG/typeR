library(chillR)


### Name: chilling_hourtable
### Title: Add chilling and heat accumulation to table of hourly
###   temperatures
### Aliases: chilling_hourtable
### Keywords: and calculation chill heat

### ** Examples


weather<-fix_weather(KA_weather[which(KA_weather$Year>2008),])

hourtemps<-stack_hourly_temps(weather,latitude=50.4)

cht<-chilling_hourtable(hourtemps,20)




