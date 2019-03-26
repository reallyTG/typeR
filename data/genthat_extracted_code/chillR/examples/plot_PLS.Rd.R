library(chillR)


### Name: plot_PLS
### Title: Output of Partial Least Squares analysis results of phenology
###   vs. daily mean temperatures
### Aliases: plot_PLS
### Keywords: analysis phenology

### ** Examples


weather<-fix_weather(KA_weather[which(KA_weather$Year>2004),])
#Plots look much better with weather<-fix_weather(KA_weather)
#but that takes to long to run for passing CRAN checks

PLS_results<-PLS_pheno(
  weather_data=weather$weather,
  split_month=6,   #last month in same year
  bio_data=KA_bloom)
  
PLS_results_path<-paste(getwd(),"/PLS_output",sep="")
  
plot_PLS(PLS_results,PLS_results_path)
#plot_PLS(PLS_results,PLS_results_path,add_chill=c(307,19),add_heat=c(54,109))

dc<-daily_chill(stack_hourly_temps(weather,50.4), 11)
plscf<-PLS_chill_force(daily_chill_obj=dc, bio_data_frame=KA_bloom, split_month=6)

plot_PLS(plscf,PLS_results_path)
#plot_PLS(plscf,PLS_results_path,add_chill=c(307,19),add_heat=c(54,109))






