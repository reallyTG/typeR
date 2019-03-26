library(analysisPipelines)


### Name: savePipeline
### Title: Saves the 'AnalysisPipeline' or 'StreamingAnalysisPipeline'
###   object to the file system without outputs
### Aliases: savePipeline savePipeline,BaseAnalysisPipeline-method
###   savePipeline,MetaAnalysisPipeline-method

### ** Examples

## Not run: 
##D   library(analysisPipelines)
##D   pipelineObj <- AnalysisPipeline(input = iris)
##D   pipelineObj %>>% savePipeline(path = "./test.RDS")
## End(Not run)



