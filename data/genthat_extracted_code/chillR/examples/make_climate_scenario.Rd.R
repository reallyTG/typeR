library(chillR)


### Name: make_climate_scenario
### Title: Make climate scenario
### Aliases: make_climate_scenario
### Keywords: utility

### ** Examples


chill<-chilling(stack_hourly_temps(fix_weather(KA_weather[which(KA_weather$Year>1990),]),
   latitude=50.4))
multi_chills<-list('2001'=chill,'2005'=chill,'2009'=chill)
chills_to_plot<-make_climate_scenario(multi_chills,caption=c("Historic","data"),
   time_series=TRUE,historic_data=chill)
chills_to_plot<-make_climate_scenario(multi_chills,caption=c("Future1"),add_to=chills_to_plot)
chills_to_plot<-make_climate_scenario(multi_chills,caption=c("Future2"),add_to=chills_to_plot)
plot_climate_scenarios(chills_to_plot,metric="Chill_portions",metric_label="Chill Portions")

  



