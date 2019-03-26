library(pact)


### Name: print.eval.cv
### Title: Print an object of class 'eval.cv'
### Aliases: print.eval.cv

### ** Examples

data(prostateCancer)
Y <- prostateCancer[,3:4]
Xf <- prostateCancer[,7:8]
Xv <- prostateCancer[,c(5:6,9)]
Treatment <- as.factor(prostateCancer[,2])
p <- pact.fit(Y=Y, Xf=Xf, Xv=Xv, Treatment=Treatment, family="cox", varSelect="lasso")
cv <- pact.cv(p, nfold=5)
eval <- eval.pact.cv(cv, method="discrete", g=log(0.80))
eval



