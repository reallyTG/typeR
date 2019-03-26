library(BAS)


### Name: predict.bas
### Title: Prediction Method for an object of class BAS
### Aliases: predict.bas predict
### Keywords: regression

### ** Examples


data("Hald")
hald.gprior =  bas.lm(Y ~ ., data=Hald, alpha=13, prior="g-prior")

predict(hald.gprior, newdata=Hald, estimator="BPM", se.fit=TRUE)
# same as fitted
fitted(hald.gprior,estimator="BPM")
# default is BMA and estimation of mean vector
hald.bma = predict(hald.gprior, top=5, se.fit=TRUE)
confint(hald.bma)

hald.bpm = predict(hald.gprior, newdata=Hald[1,],
                    se.fit=TRUE,
                    estimator="BPM")
confint(hald.bpm)
# extract variables
variable.names(hald.bpm)

hald.hpm = predict(hald.gprior, newdata=Hald[1,],
                    se.fit=TRUE,
                    estimator="HPM")
confint(hald.hpm)
variable.names(hald.hpm)

hald.mpm = predict(hald.gprior, newdata=Hald[1,],
                    se.fit=TRUE,
                    estimator="MPM")
confint(hald.mpm)
variable.names(hald.mpm)




