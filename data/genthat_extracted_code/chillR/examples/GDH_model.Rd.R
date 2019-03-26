library(chillR)


### Name: GDH_model
### Title: Calculation of cumulative heat according to the Growing Degree
###   Hours Model (alternative function name)
### Aliases: GDH_model
### Keywords: and calculation chill heat

### ** Examples


weather<-fix_weather(KA_weather[which(KA_weather$Year>2006),])

hourtemps<-stack_hourly_temps(weather,latitude=50.4)

GDH_model(hourtemps$hourtemps$Temp)




