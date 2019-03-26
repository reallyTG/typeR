library(chillR)


### Name: temperature_scenario_baseline_adjustment
### Title: Make temperature scenario relative to a particular baseline
### Aliases: temperature_scenario_baseline_adjustment
### Keywords: utility

### ** Examples


baseline_temperature_scenario<-list(data=data.frame(Tmin=c(1,1,1,1,1,1,1,1,1,1,1,1),
                                                    Tmax=c(1,1,1,1,1,1,1,1,1,1,1,1)),
                                                    scenario_year=1990,
                                                    reference_year=1975,
                                                    scenario_type="relative")
                                                    
temperature_scenario<-list(data=data.frame(Tmin=c(4,4,4,4,4,4,4,4,4,4,4,4),
                                           Tmax=c(4,4,4,4,4,4,4,4,4,4,4,4)),
                                           scenario_year=2000,
                                           reference_year=1990,
                                           scenario_type="relative")
                                           
relative_temperature_scenario<-temperature_scenario_baseline_adjustment(
                     baseline_temperature_scenario,temperature_scenario,
                     temperature_check_args=NULL)
                                                                       
baseline_temperature_scenario<-list(data=data.frame(Tmin=c(-5,-2,2,5,10,12,15,15,12,10,5,1),
                                                    Tmax=c( 1, 4,7,10,15,18,22,24,17,15,11,6)),
                                                    scenario_year=1980,
                                                    reference_year=NA,
                                                    scenario_type="absolute")
                                                    
temperature_scenario<-list(data=data.frame(Tmin=c(-3,0,4,7,12,14,17,17,14,12,7,3),
                                                    Tmax=c(3,6,9,12,17,20,24,26,19,17,13,8)),
                                           scenario_year=2000,
                                           reference_year=NA,
                                           scenario_type="absolute")
                                           
relative_temperature_scenario<-temperature_scenario_baseline_adjustment(
                     baseline_temperature_scenario,temperature_scenario,
                     temperature_check_args=NULL)
                                            
 



