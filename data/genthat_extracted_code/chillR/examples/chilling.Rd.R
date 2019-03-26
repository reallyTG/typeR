library(chillR)


### Name: chilling
### Title: Calculation of chilling and heat from hourly temperature records
### Aliases: chilling
### Keywords: and calculation chill heat

### ** Examples




#weather<-fix_weather(KA_weather[which(KA_weather$Year>2006),])
#hourtemps<-stack_hourly_temps(weather,latitude=50.4)
#chilling(hourtemps,305,60)

chilling(stack_hourly_temps(fix_weather(KA_weather[which(KA_weather$Year>2006),]),latitude=50.4))




