library(TSPred)


### Name: sMAPE
### Title: sMAPE error of prediction
### Aliases: sMAPE
### Keywords: SMAPE prediction error

### ** Examples

data(SantaFe.A,SantaFe.A.cont)
pred <- marimapred(SantaFe.A,n.ahead=100)
sMAPE(SantaFe.A.cont[,1], pred)



