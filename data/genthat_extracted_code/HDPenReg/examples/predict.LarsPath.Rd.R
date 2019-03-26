library(HDPenReg)


### Name: predict.LarsPath
### Title: Prediction of response
### Aliases: predict.LarsPath

### ** Examples

dataset=simul(50,10000,0.4,10,50,matrix(c(0.1,0.8,0.02,0.02),nrow=2))
result=HDlars(dataset$data[1:40,],dataset$response[1:40])
y=predict(result,dataset$data[41:50,],0.3,"fraction")



