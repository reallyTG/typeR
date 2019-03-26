library(HDPenReg)


### Name: plotCoefficient
### Title: Plot of coefficients
### Aliases: plotCoefficient

### ** Examples

dataset=simul(50,1000,0.4,10,50,matrix(c(0.1,0.8,0.02,0.02),nrow=2))
result=HDfusion(dataset$data,dataset$response) 
plotCoefficient(result,result@nbStep) #plot coefficients at the last step



