## ---- echo=TRUE, eval=FALSE----------------------------------------------
#  library(devtools)
#  install_github("sambaala/linkspotter")

## ---- echo=TRUE, eval=FALSE----------------------------------------------
#  library(devtools)
#  library(httr)
#  set_config(
#    use_proxy(url="<my_proxy>", port=<my_proxy_port>)
#  )
#  install_github("sambaala/linkspotter")

## ---- echo=TRUE----------------------------------------------------------
library(linkspotter)

## ---- echo=TRUE, eval=FALSE----------------------------------------------
#  help(package="linkspotter")

## ---- echo=TRUE----------------------------------------------------------
maxNMI(iris$Sepal.Length,iris$Petal.Length)

## ---- echo=TRUE----------------------------------------------------------
corCouples<-multiBivariateCorrelation(iris)
print(corCouples)

## ---- echo=TRUE----------------------------------------------------------
corMatrixPearson<-corCouplesToMatrix(x1_x2_val = corCouples[,c('X1','X2',"pearson")])
print(corMatrixPearson)

## ---- echo=TRUE----------------------------------------------------------
corMatrixMaxNMI<-corCouplesToMatrix(x1_x2_val = corCouples[,c('X1','X2',"MaxNMI")])
print(corMatrixMaxNMI)

## ---- echo=TRUE----------------------------------------------------------
cl<-clusterVariables(corMatrix = corMatrixMaxNMI)
print(cl)

## ---- echo=TRUE----------------------------------------------------------
linkspotterGraph(corDF = corCouples, variablesClustering = cl, 
  corMethod = "pearson", minCor = 0.25, smoothEdges = FALSE, 
  dynamicNodes = FALSE)

## ---- echo=TRUE----------------------------------------------------------
linkspotterGraph(corDF = corCouples, variablesClustering = cl, 
  corMethod = "MaxNMI", minCor = 0.25, smoothEdges = F, 
  dynamicNodes = TRUE)

## ---- echo=TRUE, eval=FALSE----------------------------------------------
#  linkspotterUI(dataset = iris, corDF = corCouples,
#    variablesClustering = cl, appTitle = "Linkspotter example")

## ---- echo=TRUE----------------------------------------------------------
lsiris<-linkspotterComplete(iris)

## ---- echo=TRUE, eval=FALSE----------------------------------------------
#  lsiris<-linkspotterOnFile("iris.csv")
#  summary(lsiris)

## ---- echo=TRUE----------------------------------------------------------
summary(lsiris)

## ---- echo=TRUE, eval=FALSE----------------------------------------------
#  lsiris$launchShiny()

## ---- echo=TRUE, eval=FALSE----------------------------------------------
#  help(linkspotterComplete)

