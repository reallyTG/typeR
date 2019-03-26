library(bingat)


### Name: getLoglikeMixture
### Title: Group Finder
### Aliases: getLoglikeMixture

### ** Examples

	data(braingraphs)
	
	braingm <- getGibbsMixture(braingraphs, "adjMatrix", 5)
	brainlm <- getLoglikeMixture(braingraphs, braingm)
	brainlm
	
	### By running the loglik mixture over several groups you can find which is the optimal
	## Not run: 
##D 		mixtures <- NULL
##D 		for(i in 1:5){
##D 			tempgm <- getGibbsMixture(braingraphs, "adjMatrix", i)
##D 			mixtures[i] <- getLoglikeMixture(braingraphs, tempgm)$bic
##D 		}
##D 		
##D 		bestgroupnum <- which(min(mixtures) == mixtures)
##D 		bestgroupnum
##D 	
## End(Not run)



