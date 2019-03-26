library(analysisPipelines)


### Name: setLoggerDetails
### Title: Sets the logger configuration for the pipeline
### Aliases: setLoggerDetails setLoggerDetails,BaseAnalysisPipeline-method

### ** Examples

library(analysisPipelines)
pipelineObj <- AnalysisPipeline(input = iris)
pipelineObj %>>% setLoggerDetails(target = "file",
 targetFile = "pipeline.out") -> pipelineObj



