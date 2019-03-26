library(AnglerCreelSurveySimulation)


### Name: create_plot_from_simulation
### Title: Create a plot from a creel survey simulation
### Aliases: create_plot_from_simulation

### ** Examples


start_time <- 0 
wait_time <- 8 
n_anglers <- 50 
n_sites <- 1
sampling_prob <- wait_time/12
mean_catch_rate <- 10

tmp <- conduct_multiple_surveys(91, start_time, wait_time, n_anglers, n_sites, sampling_prob, 
                                mean_catch_rate, fishing_day_length = 12, mean_trip_length = 4)

create_plot_from_simulation(tmp, "catch")




