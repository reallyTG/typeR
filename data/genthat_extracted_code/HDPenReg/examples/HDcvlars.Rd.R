library(HDPenReg)


### Name: HDcvlars
### Title: cross validation
### Aliases: HDcvlars

### ** Examples

dataset=simul(50,10000,0.4,10,50,matrix(c(0.1,0.8,0.02,0.02),nrow=2))
result=HDcvlars(dataset$data,dataset$response,5)



