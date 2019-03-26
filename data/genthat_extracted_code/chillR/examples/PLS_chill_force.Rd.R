library(chillR)


### Name: PLS_chill_force
### Title: Partial Least Squares analysis of phenology vs. accumulated
###   daily chill and heat
### Aliases: PLS_chill_force
### Keywords: analysis and calculation chill heat phenology

### ** Examples


weather<-fix_weather(KA_weather[which(KA_weather$Year>2004),])
#Plots look much better with weather<-fix_weather(KA_weather)
#but that takes too long to run for passing CRAN checks

dc<-daily_chill(stack_hourly_temps(weather,50.4), 11)
plscf<-PLS_chill_force(daily_chill_obj=dc, bio_data_frame=KA_bloom, split_month=6)

#PLS_results_path<-paste(getwd(),"/PLS_output",sep="")
#plot_PLS(plscf,PLS_results_path)
#plot_PLS(plscf,PLS_results_path,add_chill=c(307,19),add_heat=c(54,109))







