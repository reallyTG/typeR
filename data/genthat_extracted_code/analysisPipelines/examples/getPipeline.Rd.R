library(analysisPipelines)


### Name: getPipeline
### Title: Obtain the pipeline
### Aliases: getPipeline getPipeline,BaseAnalysisPipeline-method

### ** Examples

## Not run: 
##D library(analysisPipelines)
##D pipelineObj <- AnalysisPipeline(input = iris)
##D getNumRows <- function(dataset){
##D   return(nrow(dataset))
##D }
##D registerFunction("getNumRows")
##D pipelineObj %>>% getNumRows %>>% getPipeline
## End(Not run)



