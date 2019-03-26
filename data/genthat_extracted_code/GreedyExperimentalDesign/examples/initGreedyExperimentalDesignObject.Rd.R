library(GreedyExperimentalDesign)


### Name: initGreedyExperimentalDesignObject
### Title: This method creates an object of type greedy_experimental_design
###   and will immediately initiate a search through $1_T$ space.
### Aliases: initGreedyExperimentalDesignObject

### ** Examples

 ## Not run: 
##D 	library(MASS)
##D 	data(Boston)
##D  #pretend the Boston data was an experiment setting 
##D 	#first pull out the covariates
##D  X = Boston[, 1 : 13] 
##D  #begin the greedy design search
##D 	ged = initGreedyExperimentalDesignObject(X, 
##D 		max_designs = 1000, num_cores = 3, objective = "abs_sum_diff")
##D 	#wait
##D 	ged
##D 	
## End(Not run)



