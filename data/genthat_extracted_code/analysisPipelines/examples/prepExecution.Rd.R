library(analysisPipelines)


### Name: prepExecution
### Title: Prepare the pipleline for execution
### Aliases: prepExecution prepExecution,BaseAnalysisPipeline-method

### ** Examples

## Not run: 
##D library(analysisPipelines)
##D pipelineObj <- AnalysisPipeline(input = iris)
##D pipelineObj %>>% univarCatDistPlots(uniCol = "Species",
##D  priColor = "blue", optionalPlots = 0, storeOutput = T) %>>%
##D prepExecution -> pipelineObj
## End(Not run)



