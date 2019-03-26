library(chillR)


### Name: Dynamic_Model
### Title: Calculation of cumulative chill according to the Dynamic Model
### Aliases: Dynamic_Model
### Keywords: and calculation chill heat

### ** Examples


weather<-fix_weather(KA_weather[which(KA_weather$Year>2006),])

hourtemps<-stack_hourly_temps(weather,latitude=50.4)

Dynamic_Model(hourtemps$hourtemps$Temp)




