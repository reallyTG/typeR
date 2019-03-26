library(ruin)


### Name: SparreAndersenCapitalInjections
### Title: Constructs an object of SparreAndersenCapitalInjections S4 class
### Aliases: SparreAndersenCapitalInjections

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
  capital_injection_size_parameters = list(rate = 1)
)




