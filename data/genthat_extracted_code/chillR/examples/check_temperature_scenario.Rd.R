library(chillR)


### Name: check_temperature_scenario
### Title: Check temperature scenario for consistency
### Aliases: check_temperature_scenario
### Keywords: utility

### ** Examples


temperature_scenario<-list(data=data.frame(Tmin=c(-5,-2,0, 4, 9,12,15,13,12, 9, 4,0),
                                       Tmax=c( 0, 4,8,12,15,18,21,19,17,14,11,5)),
                                       reference_year=1975,scenario_type="absolute",
                                       labels=list(GCM="none",RCM="none",Time="1950-2000"))

checked_temperature_scenario<-check_temperature_scenario(temperature_scenario,n_intervals=12,
   check_scenario_type=FALSE,scenario_check_thresholds=c(-5,10),update_scenario_type=FALSE)
                                            
checked_temperature_scenario<-check_temperature_scenario(temperature_scenario,n_intervals=12,
   check_scenario_type=TRUE,scenario_check_thresholds=c(-5,10),update_scenario_type=FALSE)
                                            
checked_temperature_scenario<-check_temperature_scenario(temperature_scenario,n_intervals=12,
  check_scenario_type=TRUE,scenario_check_thresholds=c(-5,10),update_scenario_type=TRUE)
                                            
                                            
 



