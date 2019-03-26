library(SparseDC)


### Name: sim_data
### Title: Data Simulator
### Aliases: sim_data

### ** Examples

set.seed(10)
genes <- 1000  # Simulate 1,000 genes
cells <- 100  # Simulate 100 cells per condition
clus.t1 <- c(1,2,3)  # Generate 3 clusters present in condition A
clus.t2 <- c(1,2,3)  # Generate 3 clusters present in condition B
sig.genes <- 30  # Generate 30 marker genes per cluster
sig.genes.s <- 15  # Let half of the 30 marker genes be shared.
temp_sim_dat <- sim_data(genes, cells, sig.genes, sig.genes.s,
clus.t1, clus.t2)




