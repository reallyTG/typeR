library(sybil)


### Name: optimizeProb-methods
### Title: Optimize Problem Object
### Aliases: optimizeProb optimizeProb-methods optimizeProb,modelorg-method
###   optimizeProb,sysBiolAlg-method
### Keywords: methods optimize

### ** Examples

## Not run: 
##D ## The examples here require the package glpkAPI to be
##D ## installed. If that package is not available, you have to set
##D ## the argument 'solver' (the default is: solver = SYBIL_SETTINGS("SOLVER")).
##D 
##D ## load the example data set
##D data(Ec_core)
##D 
##D ## run optimizeProb(), Ec_sf will be an object of
##D ## class optsol_optimizeProb
##D Ec_sf <- optimizeProb(Ec_core)
##D 
##D ## run optimizeProb(), Ec_sf will be a list
##D Ec_sf <- optimizeProb(Ec_core, retOptSol = FALSE)
##D 
##D ## do FBA, change the upper and lower bounds for the reactions
##D ## "ATPM" and "PFK".
##D optimizeProb(Ec_core, react = c("ATPM", "PFK"),
##D              lb = c(3, -3), ub = c(5, 6))
##D           
##D ## do FBA, perform sensitivity analysis after optimization
##D optimizeProb(Ec_core, poCmd = list("sensitivityAnalysis"))
##D 
##D ## do FBA, write the problem object to file in lp-format
##D optimizeProb(Ec_core,
##D              poCmd = list(c("writeProb", "LP_PROB",
##D                             "'Ec_core.lp'", "'lp'")))
##D 
##D ## do FBA, use "cplexAPI" as lp solver. Get all lower bounds before
##D ## solving the problem. After solving, perform a sensitivity
##D ## analysis and retrieve the reduced costs
##D opt <- optimizeProb(Ec_core, solver = "cplexAPI",
##D                     prCmd = list(c("getColsLowBnds", "LP_PROB", "1:77")),
##D                     poCmd = list("sensitivityAnalysis",
##D                                  c("getDjCPLEX",
##D                                  "LP_PROB@oobj@env",
##D                                  "LP_PROB@oobj@lp",
##D                                  "0", "react_num(Ec_core)-1")))
##D ## get lower bounds
##D preProc(opt)
##D ## get results of sensitivity analysis
##D postProc(opt)
## End(Not run)



