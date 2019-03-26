library(chillR)


### Name: tempResponse_daily_list
### Title: Calculation of climatic metrics from lists of daily temperature
###   records
### Aliases: tempResponse_daily_list
### Keywords: and calculation chill heat

### ** Examples



weather<-fix_weather(KA_weather[which(KA_weather$Year>2006),])
temperature_list<-list(weather,weather,weather)

tempResponse_daily_list(temperature_list,latitude=50.4)





