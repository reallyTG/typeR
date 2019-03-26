library(oppr)


### Name: simulate_ppp_data
### Title: Simulate data for the 'Project Prioritization Protocol'
### Aliases: simulate_ppp_data

### ** Examples

# create a simulated data set
s <- simulate_ppp_data(number_features = 5,
                       cost_mean = 100,
                       cost_sd = 5,
                       success_min_probability = 0.7,
                       success_max_probability = 0.99,
                       funded_min_persistence_probability = 0.5,
                       funded_max_persistence_probability = 0.9,
                       baseline_min_persistence_probability = 0.01,
                       baseline_max_persistence_probability = 0.4,
                       locked_in_proportion = 0.01,
                       locked_out_proportion = 0.01)

# print data set
print(s)




