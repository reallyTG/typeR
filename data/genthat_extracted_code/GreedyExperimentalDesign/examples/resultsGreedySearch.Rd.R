library(GreedyExperimentalDesign)


### Name: resultsGreedySearch
### Title: Returns the results (thus far) of the greedy design search
### Aliases: resultsGreedySearch

### ** Examples

 ## Not run: 
##D 	library(MASS)
##D 	data(Boston)
##D  #pretend the Boston data was an experiment setting 
##D 	#first pull out the covariates
##D  X = Boston[, 1 : 13]
##D  #begin the greedy design search
##D 	ged = initGreedyExperimentalDesignObject(X, 
##D 		max_designs = 1000, num_cores = 2, objective = "abs_sum_diff")
##D 	#wait
##D 	res = resultsGreedySearch(ged, max_vectors = 2)
##D 	design = res$ending_indicTs[, 1] #ordered already by best-->worst
##D  design
##D  #what is the balance on this vector?
##D 	res$obj_vals[1]
##D 	#compute balance explicitly in R to double check
##D 	compute_objective_val(X, design) #same as above
##D 	#how far have we come?
##D 	ged
##D 	#we can cut it here
##D 	stopSearch(ged)
##D 	
## End(Not run)



