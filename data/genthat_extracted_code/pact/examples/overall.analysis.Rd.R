library(pact)


### Name: overall.analysis
### Title: Overall statistics and inference
### Aliases: overall.analysis
### Keywords: pact

### ** Examples

data(prostateCancer)
Y <- prostateCancer[,3:4]
Xf <- prostateCancer[,7:8]
Xv <- prostateCancer[,c(5:6,9)]
Treatment <- as.factor(prostateCancer[,2])
p <- pact.fit(Y=Y, Xf=Xf, Xv=Xv, Treatment=Treatment, family="cox", varSelect="none")
overall.analysis(p)

### Binary response
data(EORTC10994)
Y <- as.factor(EORTC10994[,4])
Xv <- EORTC10994[,c(2,5:7)]
Treatment <- as.factor(EORTC10994[,3])
p <- pact.fit(Y=Y,Xv=Xv,Treatment=Treatment,family="binomial",varSelect="none")
overall.analysis(p)



