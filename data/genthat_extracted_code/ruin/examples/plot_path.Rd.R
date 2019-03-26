library(ruin)


### Name: plot_path
### Title: Plot a path of the simulated ruin process
### Aliases: plot_path

### ** Examples

model <- CramerLundberg(initial_capital = 10,
                        premium_rate = 1,
                        claim_poisson_arrival_rate = 1,
                        claim_size_generator = rexp,
                        claim_size_parameters = list(rate = 1))

path <- simulate_path(model = model, max_time_horizon = 10)

plot_path(path)




