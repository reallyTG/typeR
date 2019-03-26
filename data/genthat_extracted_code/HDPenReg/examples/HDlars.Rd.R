library(HDPenReg)


### Name: HDlars
### Title: Lars algorithm
### Aliases: HDlars

### ** Examples

dataset=simul(50,10000,0.4,10,50,matrix(c(0.1,0.8,0.02,0.02),nrow=2))
result=HDlars(dataset$data,dataset$response)
# Obtain estimated coefficient in matrix format
coefficient = listToMatrix(result)




