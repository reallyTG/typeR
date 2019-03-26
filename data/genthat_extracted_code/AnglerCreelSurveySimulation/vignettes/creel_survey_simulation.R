## ----setup, include = FALSE----------------------------------------------



knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------

library(AnglerCreelSurveySimulation)

anglers <- make_anglers(n_anglers = 100, mean_trip_length = 3.5, fishing_day_length = 12)


## ------------------------------------------------------------------------

head(anglers)


## ----warning = FALSE-----------------------------------------------------

library(dplyr)
library(ggplot2)

# Histogram overlaid with kernel density curve
anglers %>%
  ggplot(aes(x=trip_length)) + 
  geom_histogram(aes(y=..density..), 
                 binwidth=.1,
                 colour="black", fill="white") +
  geom_density(alpha=.2, fill="#FF6666")


## ------------------------------------------------------------------------

anglers %>%
  get_total_values(start_time = 0, wait_time = 8, sampling_prob = 8/12, mean_catch_rate = 2.5)


## ------------------------------------------------------------------------

sim <- simulate_bus_route(start_time = 0, wait_time = 8, n_sites = 1, n_anglers = 100,
                          sampling_prob = 8/12, mean_catch_rate = 2.5, fishing_day_length = 12)

sim


## ------------------------------------------------------------------------

sim <- conduct_multiple_surveys(n_sims = 20, start_time = 0, wait_time = 8, n_sites = 1,
                                n_anglers = 100, sampling_prob = 8/12, 
                                mean_catch_rate = 2.5, fishing_day_length = 12)

sim


## ------------------------------------------------------------------------

mod <- 
  sim %>% 
  lm((Ehat * catch_rate_ROM) ~ true_catch, data = .)

summary(mod)


## ------------------------------------------------------------------------

#Create a new vector of the estimated effort multiplied by estimated catch rate
sim <- 
  sim %>%
  mutate(est_catch = Ehat * catch_rate_ROM)

sim %>% 
  ggplot(aes(x = true_catch, y = est_catch)) +
  geom_point() +
  geom_abline(intercept = mod$coefficients[1], slope = mod$coefficients[2], 
              colour = "red", size = 1.01)


## ------------------------------------------------------------------------

mod <- 
  sim %>%
  lm(Ehat ~ true_effort, data = .)

summary(mod)

#Create a new vector of the estimated effort multiplied by estimated catch rate

sim %>%
  ggplot(aes(x = true_effort, y = Ehat)) +
  geom_point() +
  geom_abline(intercept = mod$coefficients[1], slope = mod$coefficients[2], 
              colour = "red", size = 1.01)


## ------------------------------------------------------------------------

start_time <- 0
wait_time <- 12
sampling_prob <- 1

sim <- conduct_multiple_surveys(n_sims = 20, start_time = start_time, wait_time = wait_time,
                                n_sites = 1, n_anglers = 100, sampling_prob = 1, 
                                mean_catch_rate = 2.5, fishing_day_length = 12)

sim


## ----echo = FALSE--------------------------------------------------------

mod <- 
  sim %>% 
  lm(Ehat ~ true_effort, data = .)

summary(mod)

sim %>%
  ggplot(aes(x = true_effort, y = Ehat)) +
  geom_point() +
  geom_abline(intercept = mod$coefficients[1], slope = mod$coefficients[2], 
              colour = "red", size = 1.01)


## ------------------------------------------------------------------------

start_time <- c(0, 4.5)
wait_time <- c(4, 3.5)
n_sites = 2
n_anglers <- c(50, 50)
fishing_day_length <- 12
sampling_prob <- sum(wait_time)/fishing_day_length

sim <- conduct_multiple_surveys(n_sims = 20, start_time = start_time, wait_time = wait_time,
                                n_sites = n_sites, n_anglers = n_anglers, 
                                sampling_prob = sampling_prob, mean_catch_rate = 2.5,
                                fishing_day_length = fishing_day_length)

sim


## ----echo = FALSE--------------------------------------------------------

mod <- 
  sim %>%
  lm(Ehat ~ true_effort, data = .)

summary(mod)

sim %>%
  ggplot(aes(x = true_effort, y = Ehat)) +
  geom_point() +
  geom_abline(intercept = mod$coefficients[1], slope = mod$coefficients[2], 
              colour = "red", size = 1.01)


## ------------------------------------------------------------------------

#Weekend clerks
start_time_w <- 2
wait_time_w <- 10
n_sites <- 1
n_anglers_w <- 75
fishing_day_length <- 12
sampling_prob <- 8/12

sim_w <- conduct_multiple_surveys(n_sims = 8, start_time = start_time_w, 
                                  wait_time = wait_time_w, n_sites = n_sites, 
                                  n_anglers = n_anglers_w, sampling_prob = sampling_prob,
                                  mean_catch_rate = 2.5, fishing_day_length = fishing_day_length)

sim_w

#Add the weekday survey and weekend surveys to the same data frame
mon_survey <- 
  sim_w %>%
  bind_rows(sim)

mod <- 
  mon_survey %>% 
  lm(Ehat ~ true_effort, data = .)

summary(mod)


## ----echo = FALSE--------------------------------------------------------

mon_survey %>%
  ggplot(aes(x = true_effort, y = Ehat)) +
  geom_point() +
  geom_abline(intercept = mod$coefficients[1], slope = mod$coefficients[2], 
              colour = "red", size = 1.01)


