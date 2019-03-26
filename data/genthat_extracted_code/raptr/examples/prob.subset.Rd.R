library(raptr)


### Name: prob.subset
### Title: Subset probabilities above a threshold
### Aliases: prob.subset prob.subset.RapData prob.subset.RapUnsolOrSol

### ** Examples

# load data
data(sim_ru)

# generate new object with first 10 planning units
sim_ru2 <- prob.subset(sim_ru, seq_len(3), c(0.1, 0.2, 0.3))




