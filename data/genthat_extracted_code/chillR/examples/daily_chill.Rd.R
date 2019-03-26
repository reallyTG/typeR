library(chillR)


### Name: daily_chill
### Title: Calculation of daily chill and heat accumulation
### Aliases: daily_chill
### Keywords: and calculation chill heat

### ** Examples


models<-list(CP=Dynamic_Model,CU=Utah_Model,GDH=GDH)

dc<-daily_chill(stack_hourly_temps(fix_weather(KA_weather[which(KA_weather$Year>2009),]),
 latitude=50.4),11,models)





