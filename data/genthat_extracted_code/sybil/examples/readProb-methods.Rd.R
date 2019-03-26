library(sybil)


### Name: readProb-methods
### Title: Read Problem Object From File
### Aliases: readProb readProb-methods
###   readProb,optObj_clpAPI,character-method
###   readProb,optObj_cplexAPI,character-method
###   readProb,optObj_glpkAPI,character-method
###   readProb,optObj_lpSolveAPI,character-method
### Keywords: methods optimize

### ** Examples

	## Not run: 
##D 		# In very rare cases it is handy to save a sysBiolAlg-object:
##D 
##D 		library(sybil)
##D 		data(Ec_core)
##D 		
##D 		# create a sysBiolAlg object (we use here GLPK (!))
##D 		prob <- sysBiolAlg(Ec_core, algorithm = "fba", solver="glpkAPI")
##D 		
##D 		# write the R-object to disc
##D 		save(file="prob.RData",prob)
##D 		
##D 		# now write the linear program part (managed by the solver) to disc
##D 		writeProb(prob@problem, fname="prob.lp", ff="lp")
##D 
##D 		# start new R session
##D 
##D 		library(sybil)
##D 		library(glpkAPI)
##D 		load("prob.RData") # restore the R-object
##D 		prob@problem@oobj <- initProbGLPK() # initialize a new linear program
##D 		readProb(problem(prob), fname="prob.lp") # load the previously saved linear program
##D 	
## End(Not run)



