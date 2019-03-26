library(starmie)


### Name: clumpak
### Title: Run the CLUMPP algorithms.
### Aliases: clumpak

### ** Examples

# Read in Structure files
multiple_runs_k10 <- exampleStructure("mcmc_diagnostics")
Q_list <- lapply(multiple_runs_k10, getQ)
clumpak_results <- clumpak(Q_list)



