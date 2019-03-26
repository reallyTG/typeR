library(nos)


### Name: freqMat_2_edge
### Title: Convert a frequency interaction matrix to an edge list
### Aliases: freqMat_2_edge

### ** Examples

sim_dat <- matrix(c(0, 2, 1, 0, 1, 2, 0, 1), ncol = 4) #simulate bipartite matrix
rownames(sim_dat) <- c("A", "B") #name the consumed species
colnames(sim_dat) <- c("C", "D", "A", "E") #name the consumer species
freqMat_2_edge(sim_dat, bip = TRUE, sp_nam = TRUE)



