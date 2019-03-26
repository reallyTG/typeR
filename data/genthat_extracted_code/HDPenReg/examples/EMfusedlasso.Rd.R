library(HDPenReg)


### Name: EMfusedlasso
### Title: EM algorithm for fused-lasso penalty
### Aliases: EMfusedlasso

### ** Examples

dataset=simul(50,100,0.4,1,10,matrix(c(0.1,0.9,0.02,0.02),nrow=2))
result=EMfusedlasso(dataset$data,dataset$response,1,1)




