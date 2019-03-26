library(DDD)


### Name: L2phylo
### Title: Function to convert a table with speciation and extinction
###   events to a phylogeny
### Aliases: L2phylo
### Keywords: models

### ** Examples

sim = dd_sim(c(0.2,0.1,20),10)
phy = L2phylo(sim$L)
plot(phy)



