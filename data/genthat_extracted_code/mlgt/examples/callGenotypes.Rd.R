library(mlgt)


### Name: callGenotypes
### Title: Make genotype calls
### Aliases: callGenotypes callGenotypes.mlgtResult

### ** Examples

## Not run: 
##D data("mlgtResult", package="mlgt")
##D my.mlgt.Result
##D # the default method
##D my.genoytpes <- callGenotypes(my.mlgt.Result)
##D # using a custom method
##D callGenotypes.custom <- function(table, maxPropUniqueVars=0.5) {
##D 	table$status <- "notCalled"
##D 	table$propUniqueVars <- table$numbVar/table$numbSeq
##D 	table$status <- ifelse(table$propUniqueVars <= maxPropUniqueVars,"good", "bad")
##D 	return(table)
##D }
##D my.custom.Genotypes <- callGenotypes(my.mlgt.Result, method="callGenotypes.custom")
## End(Not run)



