library(SGP)


### Name: abcSGP
### Title: Perform 6 step sequence: prepareSGP, analyzeSGP, combineSGP,
###   summarizeSGP, visualizeSGP, and outputSGP
### Aliases: abcSGP
### Keywords: documentation

### ** Examples

## Not run: 
##D ## Runs all 5 steps
##D 
##D Demonstration_SGP <- abcSGP(sgp_object=sgpData_LONG, state="DEMO")
##D 
##D 
##D ## Or letting the function detect the state.
##D 
##D Demonstration_SGP <- abcSGP(sgpData_LONG)
##D 
##D 
##D ###
##D ###  Example uses of the parallel.config argument
##D ###
##D 
##D Demonstration_SGP <- abcSGP(sgpData_LONG,
##D 	parallel.config=list(
##D             BACKEND="PARALLEL", TYPE="PSOCK",
##D             WORKERS=list(
##D                PERCENTILES=8, BASELINE_PERCENTILES=8, PROJECTIONS=7, LAGGED_PROJECTIONS=6,
##D                SUMMARY=8,
##D                GA_PLOTS=8, SG_PLOTS=8)
##D 	)
##D )
##D 
## End(Not run)



