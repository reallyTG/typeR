library(BAS)


### Name: fitted.bas
### Title: Fitted values for a BAS BMA objects
### Aliases: fitted.bas fitted
### Keywords: regression

### ** Examples


data(Hald)
hald.gprior =  bas.lm(Y~ ., data=Hald, prior="ZS-null", initprobs="Uniform")
plot(Hald$Y, fitted(hald.gprior, estimator="HPM"))
plot(Hald$Y, fitted(hald.gprior, estimator="BMA", top=3))
plot(Hald$Y, fitted(hald.gprior, estimator="MPM"))
plot(Hald$Y, fitted(hald.gprior, estimator="BPM"))




