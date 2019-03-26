library(analysisPipelines)


### Name: setInput
### Title: Sets the input for an 'AnalysisPipeline' or
###   'StreamingAnalysisPipeline' object
### Aliases: setInput setInput,BaseAnalysisPipeline-method

### ** Examples

  library(analysisPipelines)
  pipelineObj <- AnalysisPipeline()
  pipelineObj %>>% setInput(input = iris) -> pipelineObj



