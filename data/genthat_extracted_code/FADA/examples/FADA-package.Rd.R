library(FADA)


### Name: FADA-package
### Title: Variable selection for supervised classification in high
###   dimension
### Aliases: FADA-package

### ** Examples

 ### Not run 
 ### example of an entire analysis with FADA package if a testing data set is available
 ### loading data
 # data(data.train)
 # data(data.test)
 
 # dim(data.train$x) # 30 250
 # dim(data.test$x) # 1000 250

 ### decorrelation of the training data set
 # res = decorrelate.train(data.train) # Optimal number of factors is 3
 ### decorrelation of the testing data set afterward
 # res2 = decorrelate.test(res,data.test)

 ### classification step with sda, using local false discovery rate for variable selection
 ### linear discriminant analysis
 # FADA.LDA = FADA(res2,method="sda",sda.method="lfdr")
 
 ### diagonal discriminant analysis 
 # FADA.DDA =  FADA(res2, method="sda",sda.method="lfdr",diagonal=TRUE)


### example of an entire analysis with FADA package if no testing data set is available
 ### loading data
 
 ### decorrelation step
 # res = decorrelate.train(data.train) # Optimal number of factors is 3
 
 ### classification step with sda, using local false discovery rate for variable selection
 ### linear discriminant analysis, error rate is computed by 10-fold CV (20 replications of the CV)
 # FADA.LDA = FADA(res,method="sda",sda.method="lfdr")




