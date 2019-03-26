library(analysisPipelines)


### Name: registerFunction
### Title: Register a user-defined function to be used with a
###   'AnalysisPipeline' or 'StreamingAnalysisPipeline' object
### Aliases: registerFunction

### ** Examples

## Not run: 
##D   library(analysisPipelines)
##D   getNumRows <- function(dataset){
##D    return(nrow(dataset))
##D   }
##D 
##D   registerFunction("getNumRows")
## End(Not run)



