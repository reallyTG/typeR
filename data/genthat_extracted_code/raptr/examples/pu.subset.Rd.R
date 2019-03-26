library(raptr)


### Name: pu.subset
### Title: Subset planning units
### Aliases: pu.subset pu.subset.RapData pu.subset.RapUnsolOrSol

### ** Examples

# load data
data(sim_ru)

# generate new object with first 10 planning units
sim_ru2 <- pu.subset(sim_ru, seq_len(10))




