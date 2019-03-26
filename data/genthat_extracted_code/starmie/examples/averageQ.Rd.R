library(starmie)


### Name: averageQ
### Title: Average Q matrices.
### Aliases: averageQ

### ** Examples

# Read in Structure files
multiple_runs_k10 <- exampleStructure("mcmc_diagnostics")
Q_list <- lapply(multiple_runs_k10, getQ)
avgQ <- averageQ(Q_list)



