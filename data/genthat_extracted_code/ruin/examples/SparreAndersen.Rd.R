library(ruin)


### Name: SparreAndersen
### Title: Constructs an object of SparreAndersen S4 class
### Aliases: SparreAndersen

### ** Examples

model <- SparreAndersen(
  initial_capital = 10,
  premium_rate = 1,
  claim_interarrival_generator = rexp,
  claim_interarrival_parameters = list(rate = 1),
  claim_size_generator = rexp,
  claim_size_parameters = list(rate = 1)
)




