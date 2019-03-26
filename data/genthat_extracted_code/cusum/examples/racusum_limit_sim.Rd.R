library(cusum)


### Name: racusum_limit_sim
### Title: Simulate control limit given false signal probability alpha for
###   RA-CUSUM charts
### Aliases: racusum_limit_sim

### ** Examples


# Patients risks are usually known from Phase I.
# If not, these risk scores can be simulated.

# define possible patient risk scores
risks <- c(0.001,0.01,0.1,0.002,0.02,0.2)

# sample risk population of size n = 100
set.seed(2046)
patient_risks <- sample(x = risks, size = 100, replace = TRUE)

# simulate control limits for alpha = 0.05
racusum_limit_sim(patient_risks,
   odds_multiplier = 2,
   n_simulation = 1000,
   alpha = 0.05,
   seed = 2046)



