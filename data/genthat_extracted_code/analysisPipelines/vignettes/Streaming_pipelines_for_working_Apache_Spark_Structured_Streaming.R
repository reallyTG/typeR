## ----eval = F------------------------------------------------------------
#  devtools::install_github('apache/spark@v2.x.x', subdir='R/pkg')

## ------------------------------------------------------------------------
knitr::opts_chunk$set(
    eval = FALSE
  )

## ---- include=FALSE------------------------------------------------------
#  library(analysisPipelines)
#  library(SparkR)
#  
#  ## Define these variables as per the configuration of your machine. The below example is just illustrative.
#  
#  sparkHome <- "/path/to/spark/directory/"
#  sparkMaster <- "local[1]"
#  sparkPackages <- c("org.apache.spark:spark-sql-kafka-0-10_2.11:2.3.1")
#  # Set spark home variable if not present
#  if(Sys.getenv("SPARK_HOME") == "") {
#    Sys.setenv(SPARK_HOME = sparkHome)
#  }

## ---- results='hide'-----------------------------------------------------
#  sparkRSessionCreateIfNotPresent(master = sparkMaster, sparkPackages = sparkPackages)

## ------------------------------------------------------------------------
#  ## Define these variables as per the configuration of your machine. The below example is just illustrative.
#  
#  kafkaBootstrapServers <- "192.168.0.256:9092,192.168.0.257:9092,192.168.0.258:9092"
#  consumerTopic <- "topic1"
#  streamObj <- read.stream(source = "kafka", kafka.bootstrap.servers = kafkaBootstrapServers, subscribe = consumerTopic, startingOffsets="earliest")
#  printSchema(streamObj)

## ------------------------------------------------------------------------
#  
#  # Function to convert datatype json struct to columns
#  convertStructToDf <- function(streamObj) {
#    streamObj <- SparkR::select(streamObj,list(getField(streamObj$`jsontostructs(value)`,"bannerId"),
#                                     getField(streamObj$`jsontostructs(value)`,"mobile"),
#                                     getField(streamObj$`jsontostructs(value)`,"homeAppliance"),
#                                     getField(streamObj$`jsontostructs(value)`,"gamingConsole"),
#                                     getField(streamObj$`jsontostructs(value)`,"accessories"),
#                                     getField(streamObj$`jsontostructs(value)`,"brand"),
#                                     getField(streamObj$`jsontostructs(value)`,"previousPrice"),
#                                     getField(streamObj$`jsontostructs(value)`,"currentPrice"),
#                                     getField(streamObj$`jsontostructs(value)`,"discount"),
#                                     getField(streamObj$`jsontostructs(value)`,"emi"),
#                                     getField(streamObj$`jsontostructs(value)`,"crossSale"),
#                                     getField(streamObj$`jsontostructs(value)`,"customerId"),
#                                     getField(streamObj$`jsontostructs(value)`,"ts"),
#                                     getField(streamObj$`jsontostructs(value)`,"click"),
#                                     getField(streamObj$`jsontostructs(value)`,"conversion"),
#                                     getField(streamObj$`jsontostructs(value)`,"age"),
#                                     getField(streamObj$`jsontostructs(value)`,"income"),
#                                     getField(streamObj$`jsontostructs(value)`,"maritalStatus"),
#                                     getField(streamObj$`jsontostructs(value)`,"segment")))
#    colnames(streamObj) <- c("bannerId","mobile","homeAppliance","gamingConsole","accessories","brand","previousPrice","currentPrice",
#                             "discount","emi","crossSale","customerId","ts","click","conversion","age","income","maritalStatus","segment")
#    return(streamObj)
#  }
#  
#  # Function to cast columns as string, integer, etc
#  castDfColumns <- function(streamObj) {
#    streamObj <- SparkR::selectExpr(streamObj, "bannerId","mobile","homeAppliance","gamingConsole","accessories","brand",
#                            "CAST(previousPrice as INTEGER)","CAST(currentPrice as INTEGER)","CAST(discount as INTEGER)","emi",
#                            "crossSale","customerId","ts","CAST(click as INTEGER)","CAST(conversion as INTEGER)",
#                            "CAST(age as INTEGER)","CAST(income as INTEGER)","maritalStatus","segment")
#    streamObj$ts <- SparkR::to_timestamp(streamObj$ts,"yyyy-MM-dd HH:mm:ss")
#    return (streamObj)
#  }
#  
#  # Function to convert datatype json struct to columns
#  convertDfToKafkaKeyValuePairs <- function (streamObj, kafkaKey) {
#    streamObj <- SparkR::toJSON(streamObj)
#    streamObj$key <- kafkaKey
#    return(streamObj)
#  }
#  
#  # Function to summarize click stream data
#  globalUiMetrics <- function (streamObj) {
#    ## Aggregation query
#    streamObj <- SparkR::summarize(SparkR::groupBy(streamObj,streamObj$bannerId),
#                           impressions=count(streamObj$customerId),
#                           clicks=sum(streamObj$click),
#                           conversions=sum(streamObj$conversion))
#    SparkR::colnames(streamObj) <- c("banner_id","impressions","clicks","conversions")
#    return (streamObj)
#  }
#  

## ------------------------------------------------------------------------
#  # Define pipeline object
#  pipelineObj <- analysisPipelines::StreamingAnalysisPipeline(input = streamObj)
#  
#  consumerDataSchema <- structType(structField("bannerId", "string"),
#                                   structField("mobile", "string"),
#                                   structField("homeAppliance", "string"),
#                                   structField("gamingConsole", "string"),
#                                   structField("accessories", "string"),
#                                   structField("brand", "string"),
#                                   structField("previousPrice", "string"),
#                                   structField("currentPrice", "string"),
#                                   structField("discount", "string"),
#                                   structField("emi", "string"),
#                                   structField("crossSale", "string"),
#                                   structField("customerId", "string"),
#                                   structField("ts", "string"),
#                                   structField("click", "string"),
#                                   structField("conversion", "string"),
#                                   structField("age", "string"),
#                                   structField("income", "string"),
#                                   structField("maritalStatus", "string"),
#                                   structField("segment", "string"))
#  
#  # Register user-defined functions
#  registerFunction("convertStructToDf", "", functionType = "streaming", engine = "spark-structured-streaming")
#  registerFunction("castDfColumns", "", functionType = "streaming", engine = "spark-structured-streaming")
#  registerFunction("convertDfToKafkaKeyValuePairs", "", functionType = "streaming", engine = "spark-structured-streaming")
#  
#  getRegistry()
#  
#  # Define pipeline
#  # Do data prep
#  pipelineObj %>% castKafkaStreamAsString_sparkSS() %>%
#    convertKafkaValueFromJson_sparkSS(schema = consumerDataSchema, outAsIn = T) %>% convertStructToDf_sparkSS(outAsIn = T) %>% castDfColumns_sparkSS(outAsIn = T, storeOutput = T) -> pipelineObj
#  
#  pipelineObj %>>% getPipeline
#  pipelineObj %>>% visualizePipeline

## ------------------------------------------------------------------------
#  
#  ## Run pipeline
#  pipelineObj %>% generateOutput() -> pipelineObj
#  
#  ## Write to output stream
#  streamObj <- pipelineObj %>>% getOutputById("4")
#  streamObj

