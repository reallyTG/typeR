library(AnglerCreelSurveySimulation)


### Name: simulate_bus_route
### Title: Simulate a bus route survey
### Aliases: simulate_bus_route

### ** Examples

# To simulate one bus route survey that takes place in the morning, these values are used
#start time at access sites
startTimeAM <- c(1, 2,3,4,5) 
#wait time at access sites
waitTimeAM <- c(.5, .5, .5, .5, 2) 
#the number of anglers that will visit access site throughout the day
nanglersAM <- c(10,10,10,10,50) 
# the number of sites to be visited
nsitesAM <- 5
# the sampling probability.  Here it is .5 because we are only conducting this 
# survey during the first 50% of the fishing day
sampling_prob <- .5
# the mean catch rate.  Here it is 2.5 which equals 2.5 fish/hour
mean_catch_rate <- 2.5

simulate_bus_route(start_time = startTimeAM, wait_time = waitTimeAM, n_anglers = nanglersAM, 
n_sites = nsitesAM, sampling_prob = sampling_prob, mean_catch_rate = mean_catch_rate)

# To simulate one traditional access point survey where the creel clerk arrives, 
# counts anglers, and interviews anglers that have completed their trips
start_time = 0.001 
wait_time = 8
#nanglers can be informed by previously-collected data
n_anglers = 1000 
n_sites = 1
# sampling probability here is 8/12 because we are staying at the access site
# for 8 hours of a 12-hour fishing day.  To adjust the fishing day length, an
# additional 'fishing_day_length' argument needs to be passed to this function.
sampling_prob <- (8/12)
# the mean catch rate.
mean_catch_rate <- 5

simulate_bus_route(start_time, wait_time, n_anglers, n_sites, sampling_prob, mean_catch_rate)




