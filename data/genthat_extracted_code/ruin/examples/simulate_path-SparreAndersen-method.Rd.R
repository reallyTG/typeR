library(ruin)


### Name: simulate_path,SparreAndersen-method
### Title: Simulates a path of a Sparre Andersen model
### Aliases: simulate_path,SparreAndersen-method

### ** Examples

model <- SparreAndersen(initial_capital = 10,
                        premium_rate = 1,
                        claim_interarrival_generator = rexp,
                        claim_interarrival_parameters = list(rate = 2),
                        claim_size_generator = rexp,
                        claim_size_parameters = list(rate = 1))

path <- simulate_path(model = model, max_time_horizon = 10)



