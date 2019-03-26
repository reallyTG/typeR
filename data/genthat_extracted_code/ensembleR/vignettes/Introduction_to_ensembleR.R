## ----eval=FALSE----------------------------------------------------------
#  install.packages("ensembleR", dependencies = c("Imports", "Suggests"))

## ----eval=FALSE----------------------------------------------------------
#  predictions<-ensemble(training,testing,outcomeName,BaseModels,TopModel)

## ----eval=FALSE----------------------------------------------------------
#  str(iris)

## ----eval=FALSE----------------------------------------------------------
#  library(ensembleR)
#  
#  preds<-ensemble(iris[1:125,],iris[126:150,],'Species',c('rpart','treebag','gbm','knn','svmLinear'),'rf')
#  
#  table(preds)
#  
#  plot(preds)

