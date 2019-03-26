library(starmie)


### Name: averagePairWiseSimilarityH
### Title: Average Q matrices.
### Aliases: averagePairWiseSimilarityH

### ** Examples

# Read in Structure files
multiple_runs_k10 <- exampleStructure("mcmc_diagnostics")
Q_list <- lapply(multiple_runs_k10, getQ)
avgQ <- averagePairWiseSimilarityH(Q_list)



