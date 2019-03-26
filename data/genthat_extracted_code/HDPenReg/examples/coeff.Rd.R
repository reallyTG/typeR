library(HDPenReg)


### Name: coeff
### Title: get coefficients at a given step.
### Aliases: coeff

### ** Examples

dataset=simul(50,1000,0.4,10,50,matrix(c(0.1,0.8,0.02,0.02),nrow=2))
result=HDfusion(dataset$data,dataset$response)
coefficient=coeff(result,result@nbStep) #get the coefficients



