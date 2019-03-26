library(TSPred)


### Name: MAXError
### Title: Maximal error of prediction
### Aliases: MAXError
### Keywords: maximal prediction error

### ** Examples

data(SantaFe.A,SantaFe.A.cont)
pred <- marimapred(SantaFe.A,n.ahead=100)
MAXError(SantaFe.A.cont[,1], pred)



