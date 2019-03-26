library(chillR)


### Name: fix_weather
### Title: Weather data fixer and quality checker
### Aliases: fix_weather
### Keywords: utility

### ** Examples


fix_weather(KA_weather,2000,2010)

#use a subset of the KA_weather dataset and add an additional day after a gap
KA_weather_gap<-rbind(KA_weather,c(Year=2011,Month=3,Day=3,Tmax=26,Tmin=14)) 
#fill in the gaps
fix_weather(KA_weather_gap, 1990,2011,300,100)

#fix_weather(KA_weather)

 



