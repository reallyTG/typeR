library(BAS)


### Name: confint.pred.bas
### Title: Compute Credible (Bayesian Confidence) Intervals for a BAS
###   predict object
### Aliases: confint.pred.bas
### Keywords: regression

### ** Examples


data("Hald")
hald.gprior =  bas.lm(Y~ ., data=Hald, alpha=13, prior="g-prior")
hald.pred = predict(hald.gprior, estimator="BPM", predict=FALSE, se.fit=TRUE)
confint(hald.pred, parm="mean")
confint(hald.pred)  #default
hald.pred = predict(hald.gprior, estimator="BMA", predict=FALSE, se.fit=TRUE)
confint(hald.pred)





