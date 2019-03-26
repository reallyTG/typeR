library(SGP)


### Name: baselineSGP
### Title: Analyze student data to produce student growth percentiles and
###   coefficient matrices from a baseline (i.e. multiple cohort) norm
###   group
### Aliases: baselineSGP
### Keywords: documentation

### ** Examples

## Not run: 
##D ##  Calculate baseline referenced SGPs 
##D ## (using coefficient matrices embedded in SGPstateData)
##D 
##D Demonstration_SGP <- prepareSGP(sgpData_LONG)
##D Demonstration_SGP <-  baselineSGP(Demonstration_SGP)
##D 
##D 
##D ## Calculate baseline referenced coefficient matrices
##D 
##D SGPstateData[["DEMO"]][["Baseline_splineMatrix"]] <- NULL
##D Demonstration_SGP <- prepareSGP(sgpData_LONG)
##D DEMO_Baseline_Matrices <- baselineSGP(
##D 				Demonstration_SGP, 
##D 				return.matrices.only=TRUE, 
##D 				calculate.baseline.sgps=FALSE)
##D 
##D 
##D ## Calculate baseline referenced coefficient matrices and 
##D ## baseline referenced SGPs with 4 years of data
##D 
##D SGPstateData[["DEMO"]][["Baseline_splineMatrix"]] <- NULL
##D 
##D sgpData_LONG_4_YEAR <- subset(sgpData_LONG, YEAR!="2013_2014")
##D 
##D Demonstration_SGP <- prepareSGP(sgpData_LONG_4_YEAR)
##D Demonstration_SGP <- baselineSGP(Demonstration_SGP)
## End(Not run)  



