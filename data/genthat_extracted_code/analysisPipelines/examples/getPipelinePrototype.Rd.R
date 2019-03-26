library(analysisPipelines)


### Name: getPipelinePrototype
### Title: Obtain the prototype of the functions in the pipeline
### Aliases: getPipelinePrototype
###   getPipelinePrototype,MetaAnalysisPipeline-method

### ** Examples

## Not run: 
##D pipelineObj <- AnalysisPipeline(input = iris)
##D pipelineObj %>>% univarCatDistPlots(uniCol = "Species") %>>%
##D  exportAsMetaPipeline %>>% getPipelinePrototype
## End(Not run)



