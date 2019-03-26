library(HDPenReg)


### Name: HDfusion
### Title: Fusion algorithm
### Aliases: HDfusion

### ** Examples

 
dataset=simul(50,10000,0.4,10,50,matrix(c(0.1,0.8,0.02,0.02),nrow=2))
result=HDfusion(dataset$data,dataset$response)



