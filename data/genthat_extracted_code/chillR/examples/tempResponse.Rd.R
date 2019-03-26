library(chillR)


### Name: tempResponse
### Title: Calculation of climatic metrics from hourly temperature records
### Aliases: tempResponse
### Keywords: and calculation chill heat

### ** Examples



weather<-fix_weather(KA_weather[which(KA_weather$Year>2006),])

hourtemps<-stack_hourly_temps(weather,latitude=50.4)

df=data.frame(
  lower=c(-1000,1,2,3,4,5,6),
  upper=c(1,2,3,4,5,6,1000),
  weight=c(0,1,2,3,2,1,0))

custom<-function(x) step_model(x,df)

models<-list(Chilling_Hours=Chilling_Hours,Utah_Chill_Units=Utah_Model,Chill_Portions=
  Dynamic_Model,GDH=GDH,custom=custom)

tempResponse(hourtemps,Start_JDay = 305,End_JDay = 60,models)




