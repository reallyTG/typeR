library(TMB)


### Name: as.list.sdreport
### Title: Convert estimates to original list format.
### Aliases: as.list.sdreport

### ** Examples

## Not run: 
##D example(sdreport)
##D 
##D ## Estimates as a parameter list:
##D as.list(rep, "Est")
##D 
##D ## Std Errors in the same list format:
##D as.list(rep, "Std")
##D 
##D ## p-values in the same list format:
##D as.list(rep, "Pr", p.value=TRUE)
##D 
##D ## AD reported variables as a list:
##D as.list(rep, "Estimate", report=TRUE)
##D 
##D ## Bias corrected AD reported variables as a list:
##D as.list(rep, "Est. (bias.correct)", report=TRUE)
## End(Not run)



