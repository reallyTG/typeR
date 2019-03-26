library(TSPred)


### Name: NMSE
### Title: NMSE error of prediction
### Aliases: NMSE
### Keywords: NMSE prediction error

### ** Examples

data(SantaFe.A,SantaFe.A.cont)
pred <- marimapred(SantaFe.A,n.ahead=100)
NMSE(SantaFe.A.cont[,1], pred, SantaFe.A[,1])



