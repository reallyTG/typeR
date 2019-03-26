library(analysisPipelines)


### Name: exportAsMetaPipeline
### Title: Method to export a meta-pipeline
### Aliases: exportAsMetaPipeline
###   exportAsMetaPipeline,BaseAnalysisPipeline-method

### ** Examples

## Not run: 
##D #' pipelineObj <- AnalysisPipeline(input = iris)
##D pipelineObj %>>% univarCatDistPlots(uniCol = "Species") %>>%
##D  exportAsMetaPipeline -> exportedMetaPipeline
## End(Not run)



