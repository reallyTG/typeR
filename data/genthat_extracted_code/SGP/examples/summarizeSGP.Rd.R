library(SGP)


### Name: summarizeSGP
### Title: Summarize student scale scores, proficiency levels and student
###   growth percentiles according to user specified summary group
###   variables
### Aliases: summarizeSGP
### Keywords: documentation

### ** Examples

## Not run: 
##D ## summarizeSGP is Step 4 of 5 of abcSGP
##D Demonstration_SGP <- sgpData_LONG
##D Demonstration_SGP <- prepareSGP(Demonstration_SGP)
##D Demonstration_SGP <- analyzeSGP(Demonstration_SGP)
##D Demonstration_SGP <- combineSGP(Demonstration_SGP)
##D Demonstration_SGP <- summarizeSGP(Demonstration_SGP)
##D 
##D ###  Example uses of the parallel.config argument
##D 
##D ##  Windows users  must use the parallel package and R version >= 2.13:
##D #  Note the number of workers is 8, and PSOCK type cluster is used.
##D #  This example is would be good for a single workstation with 8 cores.
##D 	. . .
##D 	parallel.config=list(
##D 		BACKEND="PARALLEL", TYPE="PSOCK",
##D 		WORKERS=list(SUMMARY=2))
##D 	. . .
##D 
##D #  doParallel package - only available with R 2.13 or newer
##D 	. . .
##D 	parallel.config=list(
##D 		BACKEND="FOREACH", TYPE="doParallel",
##D 		WORKERS=list(SUMMARY=6))
##D 	. . .
##D 
##D ##  parallel package - only available with R 2.13 or newer
##D #  Note the number of workers is 50, and MPI is used,
##D #  suggesting this example is for a HPC cluster usage.
##D 	. . .
##D 	parallel.config=list(
##D 		BACKEND="PARALLEL", TYPE="MPI"),
##D 		WORKERS=list(SUMMARY=50))
##D 	. . .
##D 
##D #  NOTE:  This list of parallel.config specifications is NOT exhaustive.
##D #  See examples in analyzeSGP documentation for some others.
## End(Not run)



