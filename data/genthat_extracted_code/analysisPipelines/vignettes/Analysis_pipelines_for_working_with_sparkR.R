## ----eval = F------------------------------------------------------------
#  devtools::install_github('apache/spark@v2.x.x', subdir='R/pkg')

## ------------------------------------------------------------------------
knitr::opts_chunk$set(
    eval = FALSE
  )

## ---- include=FALSE------------------------------------------------------
#  
#  library(ggplot2)
#  library(analysisPipelines)
#  library(SparkR)
#  
#  ## Define these variables as per the configuration of your machine. This is just an example.
#  sparkHome <- "/Users/naren/softwares/spark-2.3.1-bin-hadoop2.7/"
#  sparkMaster <- "local[1]"
#  sparkPackages <- c("org.apache.spark:spark-sql-kafka-0-10_2.11:2.3.1")
#  # Set spark home variable if not present
#  if(Sys.getenv("SPARK_HOME") == "") {
#    Sys.setenv(SPARK_HOME = sparkHome)
#  }

## ------------------------------------------------------------------------
#  sparkRSessionCreateIfNotPresent(master = sparkMaster, sparkPackages = sparkPackages)

## ------------------------------------------------------------------------
#  inputDataset <- iris
#  
#  # Replacing '.' in column names with '_' as SparkR is not able to deal with '.' in column names
#  colnames(inputDataset) <- gsub(".", "_", colnames(inputDataset), fixed = T)
#  
#  pipelineObj <- AnalysisPipeline(input = iris)

## ------------------------------------------------------------------------
#  meanByGroup <- function(inputDataset, groupByColumn, colToSummarize) {
#    groupSummary <- SparkR::summarize( SparkR::groupBy(inputDataset,inputDataset[[groupByColumn]]),
#                         avg =  SparkR::mean(inputDataset[[colToSummarize]]))
#   return(groupSummary)
#  }

## ------------------------------------------------------------------------
#  # Register user-defined functions
#  registerFunction("meanByGroup", "Mean By Group",
#                                                   engine = "spark")
#  
#  # List all registered functions
#  getRegistry()
#  
#  # Define pipeline from list of registered functions
#  pipelineObj %>% meanByGroup_spark(groupByColumn = "Species", colToSummarize = "Sepal_Length", storeOutput = T) %>%
#                  meanByGroup_spark(groupByColumn = "Species", colToSummarize = "Petal_Length", storeOutput = T) -> pipelineObj
#  
#  pipelineObj %>>% getPipeline
#  pipelineObj %>>% visualizePipeline

## ----fig.width=6, fig.height=3-------------------------------------------
#  pipelineObj %>% generateOutput -> pipelineObj
#  
#  sepalLengthBySpecies <- pipelineObj %>>% getOutputById(1)
#  sepalLengthBySpeciesDf <- as.data.frame(sepalLengthBySpecies)
#  DT::datatable(head(sepalLengthBySpeciesDf),options = list(scrollX = T, scrollY = T))
#  
#  petalLengthBySpecies <- pipelineObj %>>% getOutputById(2)
#  petalLengthBySpeciesDf <- as.data.frame(petalLengthBySpecies)
#  DT::datatable(head(petalLengthBySpeciesDf),options = list(scrollX = T, scrollY = T))

