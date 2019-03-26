library(RAD)


### Name: predict.negBinMod
### Title: predict
### Aliases: predict.negBinMod
### Keywords: misc

### ** Examples

N.form <- N~1  + depth + O2_AV + temp_AV + offset(log(area))
model.N <- negBinMod(N.form,data=fish.data,est.var=TRUE,scale.covar =FALSE)
N.pred <- rep(NA,100)
for(n in 1:100) N.pred[n] <- predict(model.N,fish.data[5,],offset=10)$N
hist(N.pred)



