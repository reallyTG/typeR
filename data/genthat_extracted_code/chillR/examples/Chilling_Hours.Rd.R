library(chillR)


### Name: Chilling_Hours
### Title: Calculation of cumulative chill according to the Chilling Hours
###   Model
### Aliases: Chilling_Hours
### Keywords: and calculation chill heat

### ** Examples



weather<-fix_weather(KA_weather[which(KA_weather$Year>2006),])

hourtemps<-stack_hourly_temps(weather,latitude=50.4)

Chilling_Hours(hourtemps$hourtemps$Temp)




