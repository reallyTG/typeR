library(analysisPipelines)


### Name: getOutputById
### Title: Obtains a specific output
### Aliases: getOutputById getOutputById,BaseAnalysisPipeline-method

### ** Examples

## Not run: 
##D library(analysisPipelines)
##D pipelineObj <- AnalysisPipeline(input = iris)
##D getNumRows <- function(dataset){
##D   return(nrow(dataset))
##D }
##D registerFunction("getNumRows")
##D pipelineObj %>>% getNumRows(storeOutput = TRUE) -> pipelineObj
##D pipelineObj %>>% generateOutput %>>% getOutputById("1")
## End(Not run)



