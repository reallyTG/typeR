library(penalized)


### Name: Prediction from penalized models
### Title: Prediction based on penfit objects
### Aliases: predict,penfit-method predict
### Keywords: multivariate regression

### ** Examples


data(nki70)

pen <- penalized(Surv(time, event), penalized = nki70[1:50,8:77],
    unpenalized = ~ER+Age+Diam+N+Grade, data = nki70[1:50,], lambda1 = 10)

predict(pen, nki70[51:52,8:77], data = nki70[51:52,])



