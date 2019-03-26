library(TSPred)


### Name: MSE
### Title: MSE error of prediction
### Aliases: MSE
### Keywords: MSE prediction error

### ** Examples

data(SantaFe.A,SantaFe.A.cont)
pred <- marimapred(SantaFe.A,n.ahead=100)
MSE(SantaFe.A.cont[,1], pred)



