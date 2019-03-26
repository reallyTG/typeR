library(chillR)


### Name: load_temperature_scenarios
### Title: Load temperature scenarios
### Aliases: load_temperature_scenarios
### Keywords: utility

### ** Examples


temps<-list(Element1=data.frame(a=1,b=2),Element2=data.frame(a=c(2,3),b=c(8,4)))
save_temperature_scenarios(temps,path=getwd(),prefix="temperatures")
temps_reloaded<-load_temperature_scenarios(path=getwd(),prefix="temperatures")

 



