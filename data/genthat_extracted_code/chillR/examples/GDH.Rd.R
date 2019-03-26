library(chillR)


### Name: GDH
### Title: Calculation of cumulative heat according to the Growing Degree
###   Hours Model
### Aliases: GDH
### Keywords: and calculation chill heat

### ** Examples



weather<-fix_weather(KA_weather[which(KA_weather$Year>2006),])

hourtemps<-stack_hourly_temps(weather,latitude=50.4)

GDH(hourtemps$hourtemps$Temp)




