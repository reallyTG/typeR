library(dynsbm)


### Name: foodwebWoodward
### Title: Broadstone Stream seasonal food webs
### Aliases: foodwebWoodward

### ** Examples

## Not run: 
##D data(foodwebWoodward)
##D 
##D ## mandatory to use many nstart>>1 starting points
##D ## but estimation can be long;
##D ## better to use nb.cores>1 cores
##D list.dynsbm <- select.dynsbm(Y=foodwebWoodward$Y, 
##D 				present=foodwebWoodward$present, 
##D 				Qmin=1, Qmax=6, edge.type="binary",
##D 				directed=TRUE, self.loop=TRUE, 
##D 				nstart=200, nb.cores=4) 
##D 				
##D 
##D ## selection of Q=4 with the ICL method
##D dynsbm <- list.dynsbm[[4]]
##D 
##D ## plotting intra/inter connectivity patterns
##D connectivity.plot(dynsbm, foodwebWoodward$Y)
##D 
##D ## plotting switches between groups
##D alluvial.plot(dynsbm, timestep.abbrev="D", only.present=F)
## End(Not run)



