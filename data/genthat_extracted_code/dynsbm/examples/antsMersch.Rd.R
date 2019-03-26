library(dynsbm)


### Name: antsMersch
### Title: Dynamic contact network of ants
### Aliases: antsMersch

### ** Examples

## Not run: 
##D data(antsMersch)
##D 
##D ## better to use nstart>>1 starting points
##D ## but estimation can be long;
##D ## better to use nb.cores>1 cores
##D list.dynsbm <- select.dynsbm(antsMersch, 
##D 				Qmin=1, Qmax=6, edge.type="discrete", K=3, 
##D 				nstart=20, nb.cores=4) 
##D 				
##D 
##D ## selection of Q=3 with the 'elbow' method
##D dynsbm <- list.dynsbm[[3]]
##D 
##D ## plotting intra/inter connectivity patterns
##D connectivity.plot(dynsbm, antsMersch)
##D 
##D ## plotting switches between groups
##D alluvial.plot(dynsbm, timestep.abbrev="D", only.present=F)
## End(Not run)



