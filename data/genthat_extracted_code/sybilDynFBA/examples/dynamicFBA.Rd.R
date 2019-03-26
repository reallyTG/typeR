library(sybilDynFBA)


### Name: dynamicFBA
### Title: dynamic flux balance analysis
### Aliases: dynamicFBA
### Keywords: optimize

### ** Examples

## Not run: 
##D 	## The examples here require the package glpkAPI to be
##D 	## installed. If that package is not available, you have to set
##D 	## the argument 'solver' (the default is: solver = "glpk").
##D 
##D 	## load the example data set
##D 	data(Ec_core)
##D         lowbnd(Ec_core)[react_id(Ec_core)=='EX_glc(e)']=-10;
##D         lowbnd(Ec_core)[react_id(Ec_core)=='EX_o2(e)']=-18;
##D 	## run dynamicFBA(), Ec_df will be an object of class \code{optsol_dynamicFBA}
##D 	Ec_df <- dynamicFBA(Ec_core,substrateRxns={'EX_glc(e)'},initConcentrations=10,
##D 		initBiomass=.035,timeStep=.25,nSteps=20,verbose=3)
##D 
##D 	## plot biomass and reactions
##D 	plot(Ec_df,plotRxns=c('EX_glc(e)','EX_ac(e)'));
##D 
## End(Not run)



