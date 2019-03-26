library(TSPred)


### Name: MAPE
### Title: MAPE error of prediction
### Aliases: MAPE
### Keywords: MAPE prediction error

### ** Examples

data(SantaFe.A,SantaFe.A.cont)
pred <- marimapred(SantaFe.A,n.ahead=100)
MAPE(SantaFe.A.cont[,1], pred)



