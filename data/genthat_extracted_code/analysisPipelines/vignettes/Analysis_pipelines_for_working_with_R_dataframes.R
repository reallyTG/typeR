## ----sourcing, message=F, results='hide'---------------------------------
library(analysisPipelines)

## ----creating object, warning=F------------------------------------------
obj <- AnalysisPipeline(input = iris)

class(obj)

## ----printing object contents, warning=F---------------------------------
obj %>>% getInput %>>% str
getRegistry()

## ----pipe demo 1, warning=F----------------------------------------------
# Running univariate categorical distribution plot on the constructed object
# ?analysisPipelines::univarCatDistPlots
obj1 <- obj %>>% univarCatDistPlots(uniCol = "Species", priColor = "blue", optionalPlots = 0, storeOutput = T)
obj1 %>>% getPipeline

## ----pipe demo 2, warning=F----------------------------------------------
# Running univariate categorical distribution plot and then 
# outlier detection on the constructed object

obj %>>% univarCatDistPlots(uniCol = "Species", priColor = "green", optionalPlots = 0) %>>% 
         outlierPlot(method = "iqr", columnName = "Sepal.Length", 
              cutoffValue = 0.01, priColor = "blue", optionalPlots = 0, storeOutput = T) -> obj2
obj2 %>>% getPipeline

## ----lazy eval 1---------------------------------------------------------
length(obj1@output)

## ----lazy eval 2, warning=F----------------------------------------------
obj1Output <- obj1 %>>% generateOutput
length(obj1Output@output)

## ----lazy eval 2.5, warning=F--------------------------------------------
length(obj1@output)

## ----lazy eval 3, warning=F----------------------------------------------
# The index can range from 1 to length(obj@output)
obj1Output %>>% getOutputById("1")

## ----current register, warning=FALSE-------------------------------------
# Currently registered functions
getRegistry()

## ----bivariate definition------------------------------------------------
bivariatePlots <- function(dataset, select_var_name_1, select_var_name_2, 
                       priColor = "blue", secColor='black') {
  x=dataset[, select_var_name_1]
  y=dataset[, select_var_name_2]
  bivarPlot <- ggplot2::ggplot(dataset, ggplot2::aes(x,y)) +
    ggplot2::geom_point(color=priColor,alpha=0.7) +
    ggplot2::geom_smooth(method = lm,color=secColor) +
    ggplot2::xlab(select_var_name_1) +
    ggplot2::ylab(select_var_name_2) + 
    ggplot2::theme_bw() +
    ggplot2::ggtitle(paste('Bivariate plot for', select_var_name_1, 
                           'and', select_var_name_2, sep=' ')) +
    ggplot2::theme(plot.title = ggplot2::element_text(hjust = 0.5, size = 10), 
                   axis.text = ggplot2::element_text(size=10),
                   axis.title=ggplot2::element_text(size=10))
  return(bivarPlot)
}

registerFunction(functionName = "bivariatePlots", heading = "Bivariate Analysis")

## ----register function 2, warning=F--------------------------------------
# Chaining the user-defined function to the object's pipeline where it was registered
obj2 <- obj2 %>>% 
  bivariatePlots(select_var_name_1 = 'Sepal.Length', select_var_name_2 = 'Sepal.Width', 
                 priColor = "blue", secColor = "black")

# Printing the updated pipeline
obj2 %>>% getPipeline 

## ----register function 3, warning=F--------------------------------------
obj2Output <- obj2 %>>% generateOutput()
obj2Output %>>% getOutputById("1")
obj2Output %>>% getPipeline()

## ------------------------------------------------------------------------
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
obj %>>% getColor(color = "blue") %>>% getColumnName(columnName = "Petal.Length") %>>%
      univarCatDistPlots(uniCol = "Species", priColor = ~f1, optionalPlots = 0, storeOutput = T) %>>%
      outlierPlot(method = "iqr", columnName = ~f2, cutoffValue = 0.01, priColor = ~f1 , optionalPlots = 0) -> complexPipeline

complexPipeline %>>% getPipeline
complexPipeline %>>% generateOutput -> op
op %>>% getOutputById("3")

## ------------------------------------------------------------------------
exampleObj <- AnalysisPipeline(input = iris)

filterData <- function(dataset, conditionVar, val){
  condition <- paste0(conditionVar, '== "', val, '"')
  dataSub <- dataset %>>% dplyr::filter_(condition)
  return(dataSub)
}

summarizeData <- function(dataset, conditionVar){
  dataGrouped <-  dataset %>>% dplyr::group_by_(conditionVar) %>>% dplyr::summarise_all(dplyr::funs(avg = mean))
  return(dataGrouped)
}

plotLine <- function(dataset, y, x){
    p <- ggplot2::ggplot(data = dataset, ggplot2::aes_string(y = y, x = x)) + 
         ggplot2::geom_line(color = "blue")
  return(p)
}

plotSummary <- function(d, summaryVar, groupingVar){
  p <- ggplot2::ggplot(data = d, ggplot2::aes_string(y = paste0(summaryVar, "_avg"), x = groupingVar)) + 
         ggplot2::geom_col(fill = "blue")
  return(p)
}

registerFunction("filterData")
registerFunction("summarizeData")
registerFunction("plotLine")
registerFunction("plotSummary")



exampleObj %>>%  summarizeData(conditionVar = "Species") %>>% 
                filterData(conditionVar = "Species", val = "setosa", outAsIn = F, storeOutput = F) %>>%
                plotLine(y = "Sepal.Length", x = "Sepal.Width", outAsIn = T, storeOutput = T) %>>%
                plotSummary(d = ~f1, summaryVar = "Sepal.Length", groupingVar = "Species", storeOutput = T) ->
  exampleObj

#exampleObj %>>% visualizePipeline
#exampleObj %>>% generateOutput %>>% getOutputById("4")


## ----out.width=10, eval=F------------------------------------------------
#  complexPipeline %>>% visualizePipeline

## ----generate report and tabs, warning=F,  eval=F------------------------
#  obj2Output %>>% generateReport(path = '~/Desktop')

## ----generate report and tabs 2, message=FALSE, warning=FALSE, eval=FALSE----
#  objRep <- obj %>>% bivariatePlots(select_var_name_1 = 'Petal.Length',select_var_name_2 =  'Petal.Width',
#                             priColor = "blue", secColor = "black")
#  
#  objRep %>>% generateReport(path = '~/Desktop')

## ----save pipelines, message=FALSE, warning=FALSE, eval=FALSE------------
#  obj2 %>>% savePipeline(path = 'pipeline.RDS')

## ----load pipelines, message=FALSE, warning=FALSE, eval=FALSE------------
#  library(analysisPipelines)
#  obj3 <- loadPipeline(path = 'pipeline.RDS', input = iris)
#  getRegistry()
#  obj2 %>% getPipeline

## ----eval = F------------------------------------------------------------
#  obj2 %>>% setLoggerDetails(target = "file") -> obj2

## ----register function, warning=F----------------------------------------

sampleFunction <- function(text){
  return(text)
}

sampleException <- function(error){
  stop("There was an error with the provided input")
}

registerFunction(functionName = 'sampleFunction', "Sample", exceptionFunction = "sampleException")

getRegistry()

## ----eval = F------------------------------------------------------------
#  getRegistry()
#  saveRegistry("./registry.RDS")
#  ##.rs.restartR() # Run this on console to restart the R session
#  rm(list=ls(all=TRUE)) # Remove all objects in the R environment
#  getRegistry()
#  
#  loadRegistry("./registry.RDS")
#  getRegistry()

