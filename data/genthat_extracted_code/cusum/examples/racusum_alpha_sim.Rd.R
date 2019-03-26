library(cusum)


### Name: racusum_alpha_sim
### Title: Simulate false signal probability alpha given control limit for
###   RA-CUSUM charts
### Aliases: racusum_alpha_sim

### ** Examples


# Patients risks are usually known from Phase I.
# If not, these risk scores can be simulated.

# define possible patient risk scores
risks <- c(0.001,0.01,0.1,0.002,0.02,0.2)

# sample risk population of size n = 100
set.seed(2046)
patient_risks <- sample(x = risks, size = 100, replace = TRUE)

# control limit can be obtained with racusum_limit_sim(),
# here it is set to an arbitrary value (2.96)

# simulate false positive probability of RA-CUSUM
racusum_alpha_sim(patient_risks,
    odds_multiplier = 2,
    n_simulation = 1000,
    limit = 2.96,
    seed = 2046)



