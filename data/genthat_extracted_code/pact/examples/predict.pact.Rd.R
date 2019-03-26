library(pact)


### Name: predict.pact
### Title: Predictions from a predictive model fit
### Aliases: predict.pact

### ** Examples

### Survival response
data(prostateCancer)
Y <- prostateCancer[1:400,3:4]
Xf <- prostateCancer[1:400,7:8]
Xv <- prostateCancer[1:400,c(5:6,9)]
Treatment <- as.factor(prostateCancer[1:400,2])
p <- pact.fit(Y=Y, Xf=Xf, Xv=Xv, Treatment=Treatment, family="cox", varSelect="univar")

newxv <- prostateCancer[401:410,c(5:6,9)]
predict(p, newxv)

### Binary response
data(EORTC10994)
Y <- as.factor(EORTC10994[1:120,4])
Xv <- EORTC10994[1:120,c(2,5:7)]
Treatment <- as.factor(EORTC10994[1:120,3])
p <- pact.fit(Y=Y,Xv=Xv,Treatment=Treatment,family="binomial",varSelect="none")

newxv <- EORTC10994[121:125,c(2,5:7)]
predict(p, newxv)



