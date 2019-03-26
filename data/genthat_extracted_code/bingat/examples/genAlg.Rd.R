library(bingat)


### Name: genAlg
### Title: Find Edges Separating Two Groups using Genetic Algorithm (GA)
### Aliases: genAlg

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
##D 		
##D 		gaRes <- genAlg(braingraphs, covars, iters, popSize, earlyStop)
##D 	
## End(Not run)



