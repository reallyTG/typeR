library(chillR)


### Name: make_daily_chill_figures
### Title: Produce image of daily chill and heat accumulation
### Aliases: make_daily_chill_figures
### Keywords: and calculation chill heat

### ** Examples


weather<-fix_weather(KA_weather[which(KA_weather$Year>2005),])

dc<-daily_chill(stack_hourly_temps(weather,50.4), 11,models=list(Chill_Portions=Dynamic_Model))

md<-make_daily_chill_figures(dc, paste(getwd(),"/daily_chill_",sep=""),models="Chill_Portions",
 labels="Chill Portions")





