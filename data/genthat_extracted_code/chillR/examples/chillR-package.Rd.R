library(chillR)


### Name: chillR-package
### Title: Statistical methods for phenology analysis in temperate fruit
###   trees
### Aliases: chillR-package chillR
### Keywords: package

### ** Examples


weather<-fix_weather(KA_weather[which(KA_weather$Year>2004&!(
   KA_weather$Year==2005&KA_weather$Month<6)),])

PLS_results<-PLS_pheno(
  weather_data=KA_weather,
  split_month=6,   #last month in same year
  bio_data=KA_bloom)
  
PLS_results_path<-paste(getwd(),"/PLS_output",sep="")
  
plot_PLS(PLS_results,PLS_results_path)

stack<-stack_hourly_temps(weather,latitude=50.4)
cc<-chilling(stack,305,60)




