## ----message=F, results='hide'-------------------------------------------
knitr::opts_chunk$set(
    eval = TRUE
  )
library(analysisPipelines)

## ------------------------------------------------------------------------
pipeline <- AnalysisPipeline(input = iris)
getColor <- function(color){
  return(color)
}

getColumnName <-function(columnName){
  return(columnName)
}

registerFunction(functionName = "getColor", isDataFunction = F, firstArgClass = "character")
registerFunction(functionName = "getColumnName", isDataFunction = F, firstArgClass = "character")

getRegistry()

## ------------------------------------------------------------------------
pipeline %>>% getColor(color = "blue") %>>% getColumnName(columnName = "Sepal.Length") %>>%
      univarCatDistPlots(uniCol = "Species", priColor = ~f1, optionalPlots = 0, storeOutput = T) %>>%
      outlierPlot(method = "iqr", columnName = ~f2, cutoffValue = 0.01, priColor = ~f1 , optionalPlots = 0) -> complexPipeline

complexPipeline %>>% getPipeline
complexPipeline %>>% prepExecution -> complexPipeline

complexPipeline %>>% generateOutput -> op
op %>>% getOutputById("3")


## ------------------------------------------------------------------------

complexPipeline %>>% exportAsMetaPipeline -> complexMetaPipeline

# complexMetaPipeline %>>% visualizePipeline

## ------------------------------------------------------------------------
pipelineProto <- getPipelinePrototype(complexMetaPipeline)
str(pipelineProto)

#Setting new parameters on ToothGrowth dataset
pipelineProto$getColor$color<- "green"
pipelineProto$getColumnName$columnName<- "len"
pipelineProto$univarCatDistPlots$uniCol <- "supp"

#complexMetaPipeline %>>% visualizePipeline

## ------------------------------------------------------------------------
complexMetaPipeline %>>% createPipelineInstance(pipelineProto) -> newPipelineObj

newPipelineObj %>>% setInput(input = ToothGrowth) -> newPipelineObj

newPipelineObj %>>% generateOutput %>>% getOutputById("3")

## ----eval = FALSE--------------------------------------------------------
#  
#  complexMetaPipeline %>>% savePipeline("metaPipeline.RDS")
#  
#  #Checking if registry is updated
#  getC <- function(color){
#    return(color)
#  }
#  
#  getCol <-function(columnName){
#    return(columnName)
#  }
#  
#  registerFunction(functionName = "getC", isDataFunction = F, firstArgClass = "character")
#  registerFunction(functionName = "getCol", isDataFunction = F, firstArgClass = "character")
#  
#  getRegistry()
#  loadMetaPipeline(path = "metaPipeline.RDS") -> loadedMetaPipeline
#  getRegistry()
#  
#  pipelineProtoLoaded <- getPipelinePrototype(loadedMetaPipeline)
#  str(pipelineProtoLoaded)
#  
#  pipelineProtoLoaded$getColor$color<- "green"
#  pipelineProtoLoaded$getColumnName$columnName<- "Sepal.Length"
#  pipelineProtoLoaded$univarCatDistPlots$uniCol <- "Species"
#  
#  loadedMetaPipeline %>>% createPipelineInstance(pipelineProtoLoaded) -> newPipelineObjLoaded
#  
#  newPipelineObjLoaded %>>% setInput(input = iris) %>>%
#                          generateOutput %>>% getOutputById("3")

