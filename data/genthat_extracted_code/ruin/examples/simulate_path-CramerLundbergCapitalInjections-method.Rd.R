library(ruin)


### Name: simulate_path,CramerLundbergCapitalInjections-method
### Title: Simulates a path of a Cramer-Lundberg model's extension with
###   capital injections
### Aliases: simulate_path,CramerLundbergCapitalInjections-method

### ** Examples

model <- CramerLundbergCapitalInjections(
  initial_capital = 10,
  premium_rate = 1,
  claim_poisson_arrival_rate = 1,
  claim_size_generator = rexp,
  claim_size_parameters = list(rate = 1),
  capital_injection_poisson_rate = 1,
  capital_injection_size_generator = rexp,
  capital_injection_size_parameters = list(rate = 2)
)

path <- simulate_path(model = model, max_time_horizon = 10)



