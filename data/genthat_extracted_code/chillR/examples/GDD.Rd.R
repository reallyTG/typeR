library(chillR)


### Name: GDD
### Title: Calculation of cumulative heat according to the Growing Degree
###   Day Model
### Aliases: GDD
### Keywords: and calculation chill heat

### ** Examples



weather<-fix_weather(KA_weather[which(KA_weather$Year>2006),])

hourtemps<-stack_hourly_temps(weather,latitude=50.4)

GDD(hourtemps$hourtemps$Temp)




