library(SGP)


### Name: createKnotsBoundaries
### Title: Function to create Knots and Boundaries from supplied data in
###   LONG format.
### Aliases: createKnotsBoundaries
### Keywords: documentation

### ** Examples

## Not run: 
##D ### Run on supplied long data
##D 
##D DEMO_Knots_Boundaries <- createKnotsBoundaries(sgpData_LONG)
##D 
##D ### Run as part of prepareSGP
##D 
##D ### First NULL out knots and boundaries embedded in SGPstateData
##D 
##D SGPstateData[["DEMO"]][["Achievement"]][["Knots_Boundaries"]] <- NULL
##D Demonstration_SGP <- prepareSGP(sgpData_LONG)
## End(Not run)  



