library(bingat)


### Name: genAlgConsensus
### Title: Find Edges Separating Two Groups using Multiple Genetic
###   Algorithm's (GA) Consensus
### Aliases: genAlgConsensus gaConsensus

### ** Examples

	## Not run: 
##D 		data(braingraphs)
##D 		
##D 		### Set covars to just be group membership
##D 		covars <- matrix(c(rep(0, 19), rep(1, 19)))
##D 		
##D 		### We use low numbers for speed. The exact numbers to use depend
##D 		### on the data being used, but generally the higher iters and popSize 
##D 		### the longer it will take to run.  earlyStop is then used to stop the
##D 		### run early if the results aren't improving.
##D 		iters <- 500
##D 		popSize <- 200
##D 		earlyStop <- 250
##D 		numRuns <- 3
##D 		
##D 		gaRes <- genAlgConsensus(braingraphs, covars, .5, numRuns, FALSE, 3, 
##D 				iters, popSize, earlyStop)
##D 	
## End(Not run)



