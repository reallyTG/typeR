library(chillR)


### Name: bloom_prediction2
### Title: Bloom prediction from chilling and forcing requirements, assumed
###   to be fulfilled strictly in sequence - version 2
### Aliases: bloom_prediction2
### Keywords: bloom prediction

### ** Examples



hourtemps<-stack_hourly_temps(fix_weather(KA_weather[which(KA_weather$Year>2008),]),latitude=50.4)

CT<-chilling_hourtable(hourtemps,Start_JDay=305)

bloom_prediction2(CT,c(30,40,50),c(1000,1500,2000))
bloom_prediction2(CT,c(30,40,50),c(1000,1500,2000),permutations=TRUE)





