library(MEGENA)


### Name: get.DegreeHubStatistic
### Title: calculate module degree statistics based on random triangulation
###   model via T1 and T2 moves.
### Aliases: get.DegreeHubStatistic

### ** Examples

## Not run: 
##D 	rm(list = ls())
##D 	data(Sample_Expression)
##D 	ijw <- calculate.correlation(datExpr[1:100,],doPerm = 2)
##D 	el <- calculate.PFN(ijw[,1:3])
##D 	g <- graph.data.frame(el,directed = FALSE)
##D 
##D 	out <- get.DegreeHubStatistic(subnetwork = g,n.perm = 100,doPar = FALSE,n.core = 4)
## End(Not run)



