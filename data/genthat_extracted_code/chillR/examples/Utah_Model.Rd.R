library(chillR)


### Name: Utah_Model
### Title: Calculation of cumulative chill according to the Utah Model
### Aliases: Utah_Model
### Keywords: and calculation chill heat

### ** Examples


weather<-fix_weather(KA_weather[which(KA_weather$Year>2006),])

stack<-stack_hourly_temps(weather,latitude=50.4)

Utah_Model(stack$hourtemps$Temp)




