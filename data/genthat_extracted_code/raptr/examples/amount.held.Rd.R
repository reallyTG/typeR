library(raptr)


### Name: amount.held
### Title: Extract amount held for a solution
### Aliases: amount.held amount.held.RapSolved

### ** Examples

# load data
data(sim_rs)

# amount held (%) in best solution for each species
amount.held(sim_rs, 0)

# amount held (%) in best solution for species 1
amount.held(sim_rs, 0, 1)

# amount held (%) in second solution for each species
amount.held(sim_rs, 2)

# amount held (%) in each solution for each species
amount.held(sim_rs, NULL)




