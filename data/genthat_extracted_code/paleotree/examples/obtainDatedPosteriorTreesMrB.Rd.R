library(paleotree)


### Name: obtainDatedPosteriorTreesMrB
### Title: Get the Sample of Posterior Trees from a Dated Phylogenetic
###   Analysis with MrBayes (Or a Summary Tree, such as the MCCT)
### Aliases: obtainDatedPosteriorTreesMrB

### ** Examples

## Not run: 
##D 
##D MCCT <- obtainDatedPosteriorTreesMrB(
##D  	runFile = "C:\\myTipDatingAnalysis\\MrB_run_fossil_05-10-17.nex.run1.t",
##D  	nRuns = 2, burnin = 0.5,
##D 		outputTrees = "MCCT", file = NULL)
##D 
##D MAP <- obtainDatedPosteriorTreesMrB(
##D  	runFile = "C:\\myTipDatingAnalysis\\MrB_run_fossil_05-10-17.nex.run1.t",
##D  	nRuns = 2, burnin = 0.5, getFixedTimes = TRUE,
##D 		outputTrees = "MAP", file = NULL)
##D 
##D # get a root age from the fixed ages for tips
##D setRootAge(tree = MAP)
##D 
##D #pull a hundred trees randomly from the posterior
##D hundredRandomlySelectedTrees <- obtainDatedPosteriorTreesMrB(
##D  	runFile = "C:\\myTipDatingAnalysis\\MrB_run_fossil_05-10-17.nex.run1.t",
##D  	nRuns = 2, burnin = 0.5, getFixedTimes = TRUE,
##D  	getRootAges = TRUE,
##D 		outputTrees = 100, file = NULL)
##D 
##D 
## End(Not run)




