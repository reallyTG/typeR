library(rFerns)


### Name: predict.rFerns
### Title: Prediction with random ferns model
### Aliases: predict.rFerns

### ** Examples

set.seed(77)
#Fetch Iris data
data(iris)
#Split into tRain and tEst set
iris[c(TRUE,FALSE),]->irisR
iris[c(FALSE,TRUE),]->irisE
#Build model
rFerns(Species~.,data=irisR)->model
print(model)

#Test
predict(model,irisE)->p
print(table(
 Predictions=p,
 True=irisE[["Species"]]))
err<-mean(p!=irisE[["Species"]])
print(paste("Test error",err,sep=" "))

#Show first OOB scores
head(predict(model,scores=TRUE))



