library(ruin)


### Name: ruin_probability
### Title: Estimate a ruin probability for a finite time horizon
### Aliases: ruin_probability

### ** Examples

model <- CramerLundberg(initial_capital = 0,
                        premium_rate = 1,
                        claim_poisson_arrival_rate = 1,
                        claim_size_generator = rexp,
                        claim_size_parameters = list(rate = 1))
ruin_probability(model = model,
                 time_horizon = 10,
                 simulation_number = 100,
                 return_paths = TRUE,
                 parallel = FALSE)




