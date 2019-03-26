library(RAD)


### Name: predict.MDMnMod
### Title: predict
### Aliases: predict.MDMnMod
### Keywords: misc

### ** Examples

N.form <- N~1  + depth + O2_AV + temp_AV + offset(log(area))
model.N <- negBinMod(N.form,data=fish.data,est.var=TRUE,scale.covar =FALSE)
fish.data$N.scale <- fish.data$N/fish.data$area
S.form <- S~1 + N.scale + depth + O2_AV + temp_AV + offset(log(area))
model.S <- truncMod(S.form,fish.data$N,data=fish.data,est.var=TRUE,scale.covar=TRUE)
n.data$N.scale <- n.data$N/n.data$area
n.data$S.scale <- n.data$S/n.data$area
nij.form <- nij~1 + N.scale + S.scale  + depth + O2_AV + temp_AV
model.nij <- MDMnMod(nij.form, data=n.data, ID=n.data$i, dist="MDMn", scale.covar=TRUE, est.var=TRUE, calc.resid=TRUE, trace=TRUE)
new.obs <- as.data.frame(t(apply(fish.data,2,mean)))
N.pred <- rep(NA,100)
S.pred <- rep(NA,100)
eta.pred <- rep(NA,100)
for(n in 1:100){
  N.pred[n] <- predict(model.N,new.obs,offset=10)$N
  # insert estimate for N into data frame for it is used, not the original value
  new.obs$N.scale <- N.pred[n]/10
  S.pred[n] <- predict(model.S,new.obs,N.pred[n],offset=10)$S
  new.obs$S.scale <- S.pred[n]/10
  eta.pred[n] <- unlist(predict(model.nij,new.obs,N.pred[n],S.pred[n])$deriv.eta)
}
hist(eta.pred)



