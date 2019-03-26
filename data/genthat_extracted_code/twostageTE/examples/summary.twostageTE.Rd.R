library(twostageTE)


### Name: summary.twostageTE
### Title: summary method for object twostageTE
### Aliases: summary.twostageTE summary

### ** Examples

X=runif(25, 0,1)
Y=X^2+rnorm(n=length(X), sd=0.1)
oneStage_IR=stageOneAnalysis(X, Y, 0.25, type="IR-wald", 0.99)
summary(oneStage_IR)




