library(analysisPipelines)


### Name: assessEngineSetUp
### Title: Assesses engine (R, Spark, Python, Spark Structured Streaming)
###   set up
### Aliases: assessEngineSetUp
###   assessEngineSetUp,BaseAnalysisPipeline-method

### ** Examples

## Not run: 
##D library(analysisPipelines)
##D pipelineObj <- AnalysisPipeline(input = iris)
##D pipelineObj %>>% univarCatDistPlots(uniCol = "Species", priColor = "blue",
##D  optionalPlots = 0) %>>% assessEngineSetUp
## End(Not run)



