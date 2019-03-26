library(raptr)


### Name: space.target
### Title: Attribute space targets
### Aliases: space.target space.target<- space.target.RapData
###   space.target<-.RapData space.target.RapUnsolOrSol
###   space.target<-.RapUnsolOrSol

### ** Examples

# load data
data(sim_rs)

# extract space targets for all species
space.target(sim_rs)

# set space targets for all species
space.target(sim_rs) <- 0.1

# extract target for first species for first space
space.target(sim_rs, 1, 1)

# set space targets for first species for first space
space.target(sim_rs, 1, 1) <- 0.5




