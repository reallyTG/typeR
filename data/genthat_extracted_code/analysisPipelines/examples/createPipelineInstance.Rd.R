library(analysisPipelines)


### Name: createPipelineInstance
### Title: Create a Pipeline object from a meta-pipeline
### Aliases: createPipelineInstance
###   createPipelineInstance,MetaAnalysisPipeline-method

### ** Examples

## Not run: 
##D pipelineObj <- AnalysisPipeline(input = iris)
##D pipelineObj %>>% univarCatDistPlots(uniCol = "Species") -> pipelineObj
##D pipelineObj %>>% exportAsMetaPipeline -> exportedMetaPipeline
##D exportedMetaPipeline %>>%
##D createPipelineInstance(newParams = exportedMetaPipeline %>>%
##D  getPipelinePrototype)
## End(Not run)



