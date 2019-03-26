library(AnglerCreelSurveySimulation)


### Name: get_total_values
### Title: Conduct a creel survey of a population of anglers at an access
###   site.
### Aliases: get_total_values

### ** Examples

library(dplyr)   
set.seed(256)

start_time = .001 #start of fishing day
end_time = 12 #end of fishing day
mean_catch_rate = 0.1 #this will cause VERY few fish to be caught!

make_anglers(100) %>%  
  get_total_values(start_time = start_time, 
                   end_time = end_time, mean_catch_rate = mean_catch_rate)

start_time = .001 #start of fishing day
end_time = 6 #halfway through the fishing day
sampling_prob = .5 #this needs to be .5 because we are sampling only 50% of the fishing day
mean_catch_rate = 0.1 #this will cause VERY few fish to be caught!

make_anglers(100) %>%  
  get_total_values(start_time = start_time, end_time = end_time, 
                   sampling_prob = sampling_prob, mean_catch_rate = mean_catch_rate)
                   



