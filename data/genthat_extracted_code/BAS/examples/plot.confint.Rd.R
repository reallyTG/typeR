library(BAS)


### Name: plot.confint.bas
### Title: Plot Bayesian Confidence Intervals
### Aliases: plot.confint.bas
### Keywords: bayesian regression

### ** Examples


data(Hald)
hald.ZS = bas.lm(Y ~ ., data=Hald, prior="ZS-null", modelprior=uniform())
hald.coef = confint(coef(hald.ZS), parm=2:5)
plot(hald.coef)
plot(hald.coef, horizontal=TRUE)
plot(confint(predict(hald.ZS, se.fit=TRUE), parm="mean"))




