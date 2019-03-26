library(ruin)


### Name: CramerLundberg
### Title: Constructs an object of CramerLundberg S4 class
### Aliases: CramerLundberg

### ** Examples

model <- CramerLundberg(initial_capital = 10,
                        premium_rate = 1,
                        claim_poisson_arrival_rate = 1,
                        claim_size_generator = rexp,
                        claim_size_parameters = list(rate = 1))




