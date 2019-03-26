library(analysisPipelines)


### Name: visualizePipeline
### Title: Visualizes the pipeline as a graph
### Aliases: visualizePipeline
###   visualizePipeline,BaseAnalysisPipeline-method
###   visualizePipeline,MetaAnalysisPipeline-method

### ** Examples

## Not run: 
##D library(analysisPipelines)
##D pipelineObj <- AnalysisPipeline(input = iris)
##D pipelineObj %>>% univarCatDistPlots(uniCol = "Species",
##D  priColor = "blue", optionalPlots = 0, storeOutput = T) %>>%
##D visualizePipeline
## End(Not run)



