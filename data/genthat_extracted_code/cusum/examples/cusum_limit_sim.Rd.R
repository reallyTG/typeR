library(cusum)


### Name: cusum_limit_sim
### Title: Simulate control limit given false signal probability alpha for
###   CUSUM charts
### Aliases: cusum_limit_sim

### ** Examples


# simulate control limits for alpha = 0.05
cusum_limit_sim(failure_probability = 0.05,
    n_patients = 100,
    odds_multiplier = 2,
    n_simulation = 1000,
    alpha = 0.05,
    seed = 2046)



