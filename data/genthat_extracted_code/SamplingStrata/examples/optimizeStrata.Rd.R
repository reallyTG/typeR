library(SamplingStrata)


### Name: optimizeStrata
### Title: Best stratification of a sampling frame for multipurpose surveys
### Aliases: optimizeStrata
### Keywords: survey

### ** Examples

## Not run: 
##D library(SamplingStrata)
##D data(swissframe)
##D data(swisserrors)
##D data(swissstrata)
##D # optimisation of sampling strata
##D solution <- optimizeStrata ( 
##D     errors = swisserrors, 
##D     strata = swissstrata, 
##D     cens = NULL,
##D     strcens = FALSE,
##D     initialStrata = NA,
##D     addStrataFactor = 0.01,    
##D     minnumstr = 2,
##D     iter = 60,
##D     pops = 20,
##D     mut_chance = NA,
##D     elitism_rate = 0.2,
##D     highvalue = 100000000,
##D     suggestions = NULL,
##D 	realAllocation = TRUE,
##D 	writeFiles = FALSE,
##D 	showPlot = TRUE)
##D sum(ceiling(solution$aggr_strata$SOLUZ))
##D head(solution$aggr_strata)
## End(Not run)



