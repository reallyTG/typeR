library(analysisPipelines)


### Name: generateReport
### Title: Generate a HTML report from an 'AnalysisPipeline' object
### Aliases: generateReport
###   generateReport,AnalysisPipeline,character-method

### ** Examples

## Not run: 
##D pipelineObj <- AnalysisPipeline(input = iris)
##D pipelineObj %>>% univarCatDistPlots(uniCol = "Species", storeOutput = T) -> pipelineObj
##D pipelineObj %>>% generateReport(path = ".")
## End(Not run)



