library(SDEFSR)


### Name: FUGEPSD
### Title: Fuzzy Genetic Programming-based learning for Subgroup Discovery
###   (FuGePSD) Algorithm.
### Aliases: FUGEPSD

### ** Examples

FUGEPSD(training = habermanTra,
         test = habermanTst,
         output = c("parametersFile.txt", "rulesFile.txt", "testQM.txt"),
         seed = 23783,
         nLabels = 3,
         t_norm = "Minimum/Maximum",
         ruleWeight = "Certainty_Factor",
         frm = "Normalized_Sum",
         numGenerations = 20,
         numberOfInitialRules = 15,
         crossProb = 0.5,
         mutProb = 0.2,
         insProb = 0.15,
         dropProb = 0.15,
         tournamentSize = 2,
         globalFitnessWeights = c(0.7, 0.1, 0.3, 0.2),
         ALL_CLASS = TRUE)
## Not run: 
##D Execution with a parameters file called 'ParamFile.txt' in the working directory:
##D 
##D FUGEPSD("ParamFile.txt")
##D 
## End(Not run)




