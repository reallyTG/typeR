library(pact)


### Name: pact.fit
### Title: Fits a predictive model to the full dataset
### Aliases: pact.fit
### Keywords: pact, pact.fit

### ** Examples

data(prostateCancer)
Y <- prostateCancer[,3:4]
Xf <- prostateCancer[,7:8]
Xv <- prostateCancer[,c(5:6,9)]
Treatment <- as.factor(prostateCancer[,2])
pact.fit(Y=Y, Xf=Xf, Xv=Xv, Treatment=Treatment, family="cox",varSelect="univar")



