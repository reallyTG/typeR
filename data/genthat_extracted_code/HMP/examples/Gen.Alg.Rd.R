library(HMP)


### Name: Gen.Alg
### Title: Find Taxa Separating Two Groups using Genetic Algorithm (GA)
### Aliases: Gen.Alg

### ** Examples

	## Not run: 
##D 		data(saliva)
##D 		data(throat)
##D 		
##D 		### Combine the data into a single data frame
##D 		group.data <- list(saliva, throat)
##D 		group.data <- formatDataSets(group.data)
##D 		data <- do.call("rbind", group.data)
##D 		
##D 		### Normalize the data by subject
##D 		dataNorm <- t(apply(data, 1, function(x){x/sum(x)}))
##D 		
##D 		### Set covars to just be group membership
##D 		memb <- c(rep(0, nrow(saliva)), rep(1, nrow(throat)))
##D 		covars <- matrix(memb, length(memb), 1)
##D 		
##D 		### We use low numbers for speed. The exact numbers to use depend
##D 		### on the data being used, but generally the higher iters and popSize 
##D 		### the longer it will take to run.  earlyStop is then used to stop the
##D 		### run early if the results aren't improving.
##D 		iters <- 500
##D 		popSize <- 200
##D 		earlyStop <- 250
##D 		
##D 		gaRes <- Gen.Alg(dataNorm, covars, iters, popSize, earlyStop)
##D 	
## End(Not run)



