library(chillR)


### Name: step_model
### Title: Calculation of cumulative temperature metric according to a
###   user-defined stepwise weight function
### Aliases: step_model
### Keywords: and calculation chill heat

### ** Examples



weather<-fix_weather(KA_weather[which(KA_weather$Year>2006),])

stack<-stack_hourly_temps(weather,latitude=50.4)

df=data.frame(
  lower=c(-1000,1,2,3,4,5,6),
  upper=c(1,2,3,4,5,6,1000),
  weight=c(0,1,2,3,2,1,0))

custom<-function(x) step_model(x,df)

custom(stack$Temp)

models<-list(Chilling_Hours=Chilling_Hours,Utah_Chill_Units=Utah_Model,
Chill_Portions=Dynamic_Model,GDH=GDH,custom=custom)

tempResponse(stack,Start_JDay = 305,End_JDay = 60,models)




