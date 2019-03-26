library(galgo)


### Name: geneBackwardElimination
### Title: Searches for shorter or better models using backward elimination
###   strategy
### Aliases: geneBackwardElimination
### Keywords: methods

### ** Examples
## Not run: 
##D 	rchr <- lapply(bb$bestChromosomes[1:100],geneBackwardElimination, 
##D     bb, result="shortest")
##D 	barplot(table(unlist(lapply(rchr,length))),
##D     main="Length of Shortened Chromosomes (evaluated in training)")
##D 
##D 	rchr <- lapply(bb$bestChromosomes[1:100],robustGeneBackwardElimination, 
##D     bb, result="shortest")
##D 	barplot(table(unlist(lapply(rchr,length))),main="Length of Shortened Chromosomes")
##D   
## End(Not run)



