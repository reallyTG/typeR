library(pact)


### Name: summary.pact
### Title: Summarize a predictive model fit
### Aliases: summary.pact

### ** Examples

data(prostateCancer)
Y <- prostateCancer[,3:4]
Xf <- prostateCancer[,7:8]
Xv <- prostateCancer[,c(5:6,9)]
Treatment <- as.factor(prostateCancer[,2])
p <- pact.fit(Y=Y,Xf=Xf,Xv=Xv,Treatment=Treatment,family="cox",varSelect="none")
summary(p)




