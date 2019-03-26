library(pact)


### Name: eval.pact.cv
### Title: Evaluation functions for cross-validated predictions
### Aliases: eval.pact.cv
### Keywords: pact, pact.cv

### ** Examples

### Survival response
data(prostateCancer)
Y <- prostateCancer[,3:4]
Xf <- prostateCancer[,7:8]
Xv <- prostateCancer[,c(5:6,9)]
Treatment <- as.factor(prostateCancer[,2])
p <- pact.fit(Y=Y, Xf=Xf, Xv=Xv, Treatment=Treatment, family="cox", varSelect="univar")
cv <- pact.cv(p, nfold=5)
## Not run: eval.pact.cv(cv, method="discrete", g=log(0.80), perm.test=TRUE, nperm=500)  ## At least 20% predicted reduction in HR classified as 'sensitive'
eval.pact.cv(cv, method="continuous", plot.score=TRUE, perm.test=FALSE)

### Binary response
data(EORTC10994)
Y <- as.factor(EORTC10994[,4])
Xv <- EORTC10994[,c(2,5:7)]
Treatment <- as.factor(EORTC10994[,3])
p <- pact.fit(Y=Y,Xv=Xv,Treatment=Treatment,family="binomial", varSelect="univar")
cv <- pact.cv(p, nfold=5)
## Not run: eval.pact.cv(cv, method="discrete", g=log(1), perm.test=TRUE, nperm=500)





