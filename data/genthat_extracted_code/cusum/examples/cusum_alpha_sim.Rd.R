library(cusum)


### Name: cusum_alpha_sim
### Title: Simulate false signal probability alpha given control limit for
###   CUSUM charts
### Aliases: cusum_alpha_sim

### ** Examples


# control limit can be obtained with cusum_limit_sim(),
# here it is set to an arbitrary value (2.96)

# simulate false positive probability of CUSUM
cusum_alpha_sim(failure_probability = 0.05,
    n_patients = 100,
    odds_multiplier = 2,
    n_simulation = 10000,
    limit = 2.96,
    seed = 2046)



