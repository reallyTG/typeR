library(HDPenReg)


### Name: EMlasso
### Title: EM algorithm for lasso penalty
### Aliases: EMlasso

### ** Examples

dataset=simul(50,100,0.4,1,10,matrix(c(0.1,0.9,0.02,0.02),nrow=2))
result=EMlasso(dataset$data,dataset$response)
# Obtain estimated coefficient in matrix format
coefficient = listToMatrix(result)



