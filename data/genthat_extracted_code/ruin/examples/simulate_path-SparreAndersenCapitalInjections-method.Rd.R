library(ruin)


### Name: simulate_path,SparreAndersenCapitalInjections-method
### Title: Simulates a path of a Sparre Andersen model's extension with
###   capital injections
### Aliases: simulate_path,SparreAndersenCapitalInjections-method

### ** Examples

model <- SparreAndersenCapitalInjections(
  initial_capital = 10,
  premium_rate = 1,
  claim_interarrival_generator = rexp,
  claim_interarrival_parameters = list(rate = 1),
  claim_size_generator = rexp,
  claim_size_parameters = list(rate = 1),
  capital_injection_interarrival_generator = rexp,
  capital_injection_interarrival_parameters = list(rate = 1),
  capital_injection_size_generator = rexp,
  capital_injection_size_parameters = list(rate = 2)
)

path <- simulate_path(model = model, max_time_horizon = 10)



