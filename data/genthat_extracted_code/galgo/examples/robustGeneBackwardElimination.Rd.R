library(galgo)


### Name: robustGeneBackwardElimination
### Title: Searches for shorter or better models using backward elimination
###   strategy
### Aliases: robustGeneBackwardElimination
### Keywords: methods

### ** Examples
## Not run: 
##D 	rchr <- lapply(bb$bestChromosomes[1:100],robustGeneBackwardElimination, 
##D 		bb, result="shortest")
##D 	barplot(table(unlist(lapply(rchr,length))),main="Length of Shortened Chromosomes")
##D 	
## End(Not run)



