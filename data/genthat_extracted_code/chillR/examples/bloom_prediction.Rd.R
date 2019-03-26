library(chillR)


### Name: bloom_prediction
### Title: Bloom prediction from chilling and forcing requirements, assumed
###   to be fulfilled strictly in sequence
### Aliases: bloom_prediction
### Keywords: bloom prediction

### ** Examples



hourtemps<-stack_hourly_temps(fix_weather(KA_weather[which(KA_weather$Year>2008),]),latitude=50.4)

CT<-chilling_hourtable(hourtemps,Start_JDay=305)

bloom_prediction(CT,Chill_req=60,Heat_req=5000,Chill_model="Chill_Portions",
                 Heat_model="GDH",Start_JDay=305)





