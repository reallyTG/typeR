library(raptr)


### Name: amount.target
### Title: Amount targets
### Aliases: amount.target amount.target<- amount.target.RapData
###   amount.target<-.RapData amount.target.RapUnsolOrSol
###   amount.target<-.RapUnsolOrSol

### ** Examples

# load data
data(sim_rs)

# extract amount targets for all species
amount.target(sim_rs)

# set amount targets for all species
amount.target(sim_rs) <- 0.1

# extract amount targets for first species
amount.target(sim_rs, 1)

# set amount targets for for first species
amount.target(sim_rs, 1) <- 0.5




