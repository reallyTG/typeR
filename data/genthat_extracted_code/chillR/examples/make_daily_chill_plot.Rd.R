library(chillR)


### Name: make_daily_chill_plot
### Title: Plot daily climate metric accumulation throughout the year
### Aliases: make_daily_chill_plot
### Keywords: utility

### ** Examples


day_chill<-make_daily_chill_plot(daily_chill(stack_hourly_temps(fix_weather(
  KA_weather[which(KA_weather$Year>2005),])),
  running_mean=11),focusyears=c(2001,2005),cumulative=TRUE,startdate=300,enddate=30)

 



