library(AnglerCreelSurveySimulation)


### Name: conduct_multiple_surveys
### Title: Conduct multiple simulations of a survey
### Aliases: conduct_multiple_surveys

### ** Examples


#Simulation 1
start_time <- c(1, 3.5, 6.5) 
wait_time <- c(2, 2, 3) 
n_anglers <- c(10,10,50) 
n_sites <- 3
sampling_prob <- sum(wait_time)/12
mean_catch_rate <- 3

n_sims <- 10

set.seed(256)

conduct_multiple_surveys(n_sims = n_sims, start_time = start_time, wait_time = wait_time, 
                         n_anglers = n_anglers, n_sites = n_sites, 
                         sampling_prob = sampling_prob, mean_catch_rate = mean_catch_rate)

#Simulation 2
start_time <- 0 
wait_time <- 8
n_anglers <- 100
n_sites <- 1
sampling_prob <- 8/10
mean_catch_rate <- 2.5

#One survey/week for a year
conduct_multiple_surveys(n_sims = 52, start_time, wait_time, n_anglers, n_sites, sampling_prob, 
                         mean_catch_rate, fishing_day_length = 10)
                         



