library(chillR)


### Name: bloom_prediction3
### Title: Bloom prediction from chilling and forcing requirements, assumed
###   to be fulfilled strictly in sequence - version 3
### Aliases: bloom_prediction3
### Keywords: bloom prediction

### ** Examples



hourtemps<-stack_hourly_temps(fix_weather(KA_weather[which(KA_weather$Year>2007),]),latitude=50.4)

bloom_prediction3(hourtemps,c(30,140,50),c(1000,1500,2000))

bloom_prediction3(hourtemps,c(30,40,50),c(1000,1500,2000),permutations=TRUE)





