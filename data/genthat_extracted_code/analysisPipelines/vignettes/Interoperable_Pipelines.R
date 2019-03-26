## ----echo = FALSE--------------------------------------------------------
library(analysisPipelines)
knitr::opts_chunk$set(
    eval = FALSE
  )

## ------------------------------------------------------------------------
#  
#  ## Define these variables as per the configuration of your machine. This is just an example.
#  sparkHome <- "/Users/naren/softwares/spark-2.3.1-bin-hadoop2.7/"
#  sparkMaster <- "local[1]"
#  sparkPackages <- c("org.apache.spark:spark-sql-kafka-0-10_2.11:2.3.1")
#  
#  sparkRSessionCreateIfNotPresent(sparkHome = sparkHome, master = sparkMaster, sparkPackages = sparkPackages)
#  
#  inputDataset <- iris
#  
#  # Replacing '.' in column names with '_' as SparkR is not able to deal with '.' in column names
#  colnames(inputDataset) <- gsub(".", "_", colnames(inputDataset), fixed = T)

## ------------------------------------------------------------------------
#  
#  ## Define these variables as per the configuration of your machine. This is just an example.
#  
#  analysisPipelines::setPythonEnvir('python', '/Users/naren/anaconda3/bin/python')
#  os <- reticulate::import("os")
#  numpy <- reticulate::import("numpy")
#  pandas <- reticulate::import("pandas")
#  sklearn <- reticulate::import("sklearn")
#  
#  reticulate::source_python(system.file("python/sampleFunctions.py", package = "analysisPipelines"))
#  
#  reticulate::py_config()

## ------------------------------------------------------------------------
#  pipelineObj <- AnalysisPipeline(input = inputDataset)

## ------------------------------------------------------------------------
#  getSchema <- function(inputDataset) {
#    sparkSchema <- SparkR::schema(inputDataset)
#   return(sparkSchema)
#  }
#  
#  filterData <- function(inputDataset, condition) {
#    filteredData <- SparkR::filter(inputDataset, condition)
#   return(filteredData)
#  }
#  
#  registerFunction(functionName = "getSchema", engine = "spark")
#  registerFunction(functionName = "filterData", engine = "spark")
#  
#  
#  getRegistry()

## ------------------------------------------------------------------------
#  
#  rBivarPlots <- function(dataset, select_var_name_1, select_var_name_2, priColor = "blue", secColor= "black") {
#  
#    numeric_cols <- unlist(getDatatype(dataset)['numeric_cols'])
#    cat_cols <- unlist(getDatatype(dataset)['cat_cols'])
#  
#    if (select_var_name_1 %in% numeric_cols && select_var_name_2 %in% numeric_cols) {
#      x = dataset[, select_var_name_1]
#      y = dataset[, select_var_name_2]
#      bivarPlot <-
#        ggplot2::ggplot(dataset, ggplot2::aes(x, y)) +
#        ggplot2::geom_point(color = priColor, alpha = 0.7) +
#        ggplot2::geom_smooth(method = lm, color = secColor) +
#        ggplot2::xlab(select_var_name_1) +
#        ggplot2::ylab(select_var_name_2) + ggplot2::theme_bw() +
#        ggplot2::ggtitle(paste(
#          'Bivariate plot for',
#          select_var_name_1,
#          'and',
#          select_var_name_2,
#          sep = ' '
#        )) +
#        ggplot2::theme(
#          plot.title = ggplot2::element_text(hjust = 0.5, size = 10),
#          axis.text = ggplot2::element_text(size = 10),
#          axis.title = ggplot2::element_text(size = 10)
#        )
#  
#  
#  
#    } else if (select_var_name_1 %in% cat_cols &&
#               select_var_name_2 %in% cat_cols) {
#      new_df <- dataset %>% dplyr::group_by_(.dots=c(select_var_name_1,select_var_name_2)) %>% dplyr::summarise(n = dplyr::n())
#      colfunc <- grDevices::colorRampPalette(c(priColor, "white" , secColor))
#      colorvar <- length(unique(new_df[[select_var_name_2]]))
#      a=as.vector(as.character(unique(new_df[[select_var_name_1]])))
#      y=new_df[[select_var_name_1]]
#      label=new_df[[select_var_name_2]]
#      bivarPlot <-ggplot2::ggplot(new_df, ggplot2::aes(x = y, y= n, fill = label)) +
#        ggplot2::geom_bar(position = "dodge", stat = "identity",alpha=0.9) +
#        ggplot2::guides(fill=ggplot2::guide_legend(title=select_var_name_2)) +
#        ggplot2::coord_flip()+
#        ggplot2::xlab(select_var_name_1) +
#        ggplot2::ylab("count") + ggplot2::theme_bw() +
#        ggplot2::ggtitle(paste('Bivariate plot for',select_var_name_1,'and',select_var_name_2,sep=' '))+
#        ggplot2::theme(plot.title = ggplot2::element_text(hjust = 0.5, size = 10),axis.text = ggplot2::element_text(size=10),
#                       axis.title=ggplot2::element_text(size=10),legend.position="bottom",axis.text.x=ggplot2::element_text(angle=45, hjust=1))+ ggplot2::scale_fill_manual(values = colfunc(colorvar))
#  
#  
#    } else {
#      cols <- c(select_var_name_1, select_var_name_2)
#      cat_col <- cols[which(cols %in% cat_cols)]
#      num_col <- cols[which(cols %in% numeric_cols)]
#      a = as.vector(as.character(unique(dataset[[cat_col]])))
#      y = dataset[[cat_col]]
#      x = dataset[[num_col]]
#      bivarPlot <-
#        ggplot2::ggplot(dataset, ggplot2::aes(x = y, y = x)) +
#        ggplot2::geom_point(color = priColor, alpha = 0.7) +
#        ggplot2::coord_flip() +
#        ggplot2::xlab(cat_col) +
#        ggplot2::ylab(num_col) + ggplot2::theme_bw() +
#        ggplot2::ggtitle(paste(
#          'Bivariate plot for',
#          select_var_name_1,
#          'and',
#          select_var_name_2,
#          sep = ' '
#        )) +
#        ggplot2::theme(
#          plot.title = ggplot2::element_text(hjust = 0.5, size = 10),
#          axis.text = ggplot2::element_text(size = 10),
#          axis.title = ggplot2::element_text(size = 10)
#        )
#    }
#  
#    return(bivarPlot)
#  }
#  
#  registerFunction(functionName = "rBivarPlots", engine = "r", heading = "Bivariate analysis")
#  
#  getRegistry()

## ------------------------------------------------------------------------
#  registerFunction("decisionTreeTrainAndTest", engine = "python", isDataFunction = F, firstArgClass = "numpy.ndarray")
#  getRegistry()

## ------------------------------------------------------------------------
#  
#  pipelineObj %>>% rBivarPlots(select_var_name_1 = "Sepal_Length", select_var_name_2 =  "Sepal_Width",
#                       priColor = "blue", secColor = "green", storeOutput = T) -> vizWithoutFilterPipeline
#  vizWithoutFilterPipeline %>>% getPipeline
#  vizWithoutFilterPipeline %>>% assessEngineSetUp
#  vizWithoutFilterPipeline %>>% generateOutput -> opWithoutFilter
#  opWithoutFilter %>>% getOutputById(1)

## ------------------------------------------------------------------------
#  pipelineObj %>>% filterData_spark(condition = "Species == 'setosa'") %>>%
#    rBivarPlots(select_var_name_1 = "Sepal_Length", select_var_name_2 =  "Sepal_Width",
#                       priColor = "blue", secColor = "green", outAsIn = T, storeOutput = T) -> singleFilterPipeline
#  singleFilterPipeline %>>% visualizePipeline
#  
#  singleFilterPipeline %>>% generateOutput -> opWithFilter
#  opWithFilter %>>% getOutputById(2)

## ------------------------------------------------------------------------
#  pipelineObj %>>% filterData_spark(condition = "Species == 'setosa' or Species == 'virginica'") %>>%
#    filterData_spark(condition = "Petal_Length > 3.7", outAsIn = T) %>>%
#    rBivarPlots(select_var_name_1 = "Sepal_Length", select_var_name_2 =  "Sepal_Width",
#                       priColor = "blue", secColor = "green", outAsIn = T, storeOutput = T) %>>%
#    getFeaturesForPyClassification(dataset = ~f2, featureNames = c("Sepal_Length",
#                                                                   "Sepal_Width",
#                                                                   "Petal_Length")) %>>%
#            getTargetForPyClassification(dataset = ~f2, targetVarName = "Species", positiveClass = "setosa") %>>%
#            decisionTreeTrainAndTest_py(data = ~f4, target = ~f5, newData = ~f4, storeOutput = T) -> twoFilterPipeline
#  
#  twoFilterPipeline %>>% visualizePipeline
#  
#  twoFilterPipeline %>>% generateOutput -> opWith2Filters
#  opWith2Filters %>>% getOutputById(3)
#  opWith2Filters %>>% getOutputById(6)
#  

