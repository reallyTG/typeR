library(ruin)


### Name: CramerLundbergCapitalInjections
### Title: Constructs an object of CramerLundbergCapitalInjections S4 class
### Aliases: CramerLundbergCapitalInjections

### ** Examples

model <- CramerLundbergCapitalInjections(
  initial_capital = 10,
  premium_rate = 1,
  claim_poisson_arrival_rate = 1,
  claim_size_generator = rexp,
  claim_size_parameters = list(rate = 1),
  capital_injection_poisson_rate = 1,
  capital_injection_size_generator = rexp,
  capital_injection_size_parameters = list(rate = 1)
)




