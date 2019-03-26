library(chillR)


### Name: plot_climate_scenarios
### Title: Plot multiple chilling scenario groups (or for other metrics)
### Aliases: plot_climate_scenarios
### Keywords: utility

### ** Examples


  #making 3 identical objects as scenarios; let's assume these represent the
  #years 2000, 2005 and 2010. 
  
  models<-list(Chilling_Hours=Chilling_Hours,Utah_Chill_Units=Utah_Model,Chill_Portions=
     Dynamic_Model,GDH=GDH)
  
  chill<-tempResponse(stack_hourly_temps(
     fix_weather(KA_weather[which(KA_weather$Year>2003),]),latitude=50.4),
     Start_JDay = 305,End_JDay = 60,models)
  scenario_results<-list(chill,chill,chill)
  
  climate_scenario_list<-list(list(data=scenario_results,
                                   caption=c("Historic","data"),
                                   time_series=TRUE,
                                   labels=c(2000,2005,2010),
                                   historic_data=chill),
                              list(data=scenario_results,
                                   caption=c("Scenario","1"),
                                   labels=c("Climate model 1",
                                            "Climate model 2",
                                            "Climate model 3")),
                              list(data=scenario_results,
                                   caption=c("Scenario","2")),
                              list(data=scenario_results,
                                   caption=c("Scenario","3")))
                                   
                                   
 plot_climate_scenarios(climate_scenario_list,metric="Chill_Portions",
                                 metric_label="Chill Portions",
                                 year_name="End_year",label_sides="both",
                                 reference_line=c(40,45,50),col_rect=NA,col_line=NA,
                                 texcex=2,caption_above=FALSE)
                                 
 plot_climate_scenarios(climate_scenario_list,"Chill_Portions","Chill Portions",
    texcex=1)

  
 



