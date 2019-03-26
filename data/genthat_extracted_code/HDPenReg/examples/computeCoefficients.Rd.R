library(HDPenReg)


### Name: computeCoefficients
### Title: Compute coefficients
### Aliases: computeCoefficients

### ** Examples

dataset=simul(50,10000,0.4,10,50,matrix(c(0.1,0.8,0.02,0.02),nrow=2))
result=HDlars(dataset$data[1:40,],dataset$response[1:40])
coeff=computeCoefficients(result,0.3,"fraction")



