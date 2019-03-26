library(rminer)


### Name: crossvaldata
### Title: Computes k-fold cross validation for rminer models.
### Aliases: crossvaldata
### Keywords: models

### ** Examples

 data(iris)
 # 3-fold cross validation using fit and predict
 # the control argument is sent to rpart function 
 # rpart.control() is from the rpart package
 M=crossvaldata(Species~.,iris,fit,predict,ngroup=3,seed=12345,model="rpart",
                task="prob", control = rpart::rpart.control(cp=0.05))
 print("cross validation object:")
 print(M)
 C=mmetric(iris$Species,M$cv.fit,metric="CONF")
 print("confusion matrix:")
 print(C)



