library(starmie)


### Name: plotMCMC
### Title: Plot STRUCTURE MCMC chains
### Aliases: plotMCMC

### ** Examples

#Read in Structure files
multiple_runs_k10 <- exampleStructure("mcmc_diagnostics")
print(multiple_runs_k10)
results <- plotMCMC(multiple_runs_k10, plot = TRUE)
single_run <- plotMCMC(multiple_runs_k10[[1]])



