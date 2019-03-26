library(BAS)


### Name: predict.basglm
### Title: Prediction Method for an Object of Class basglm
### Aliases: predict.basglm
### Keywords: regression

### ** Examples



data(Pima.tr, package="MASS")
data(Pima.te, package="MASS")
Pima.bas = bas.glm(type ~ ., data=Pima.tr, n.models= 2^7, method="BAS",
           betaprior=CCH(a=1, b=nrow(Pima.tr)/2, s=0), family=binomial(),
           modelprior=uniform())
pred = predict(Pima.bas, newdata=Pima.te, top=1)  # Highest Probability model
cv.summary.bas(pred$fit, Pima.te$type, score="miss-class")




