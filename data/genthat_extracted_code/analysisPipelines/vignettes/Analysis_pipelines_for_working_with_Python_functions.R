## ------------------------------------------------------------------------
knitr::opts_chunk$set(
    eval = FALSE
  )

## ------------------------------------------------------------------------
#  
#  library(analysisPipelines)
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
#  registerFunction('decisionTreeTrainAndTest', engine = "python", isDataFunction = F, firstArgClass = "numpy.ndarray")
#  getRegistry()

## ------------------------------------------------------------------------
#  data("iris")
#  trainSample <- sample(1:150, size = 100)
#  train <- iris[trainSample,]
#  test <- iris[-trainSample,]  #%>>% getFeaturesForPyClassification(featureNames = colnames(iris)[-ncol(iris)])
#  obj <- AnalysisPipeline(input = train)
#  
#  obj %>>%  getFeaturesForPyClassification(featureNames = colnames(train)[-ncol(train)]) %>>%
#            getTargetForPyClassification(targetVarName = "Species", positiveClass = "setosa") %>>%
#            getFeaturesForPyClassification(dataset = test, featureNames = colnames(test)[-ncol(test)]) %>>%
#            decisionTreeTrainAndTest_py(data = ~f1, target = ~f2, newData = ~f3, storeOutput = T) -> objDecisionTree
#  
#  objDecisionTree %>>% assessEngineSetUp
#  objDecisionTree %>>% visualizePipeline

## ------------------------------------------------------------------------
#  objDecisionTree %>>% generateOutput -> op
#  #op %>>% generateReport("~/Desktop")
#  op %>>% getOutputById("4")

