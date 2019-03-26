library(RAD)


### Name: predict.truncMod
### Title: predict
### Aliases: predict.truncMod
### Keywords: misc

### ** Examples

N.form <- N~1  + depth + O2_AV + temp_AV + offset(log(area))
model.N <- negBinMod(N.form,data=fish.data,est.var=TRUE,scale.covar =FALSE)
fish.data$N.scale <- fish.data$N/fish.data$area
S.form <- S~1 + N.scale + depth + O2_AV + temp_AV + offset(log(area))
model.S <- truncMod(S.form,fish.data$N,data=fish.data,est.var=TRUE,scale.covar=TRUE)
new.obs <- as.data.frame(t(apply(fish.data,2,mean)))
N.pred <- rep(NA,100)
S.pred <- rep(NA,100)
for(n in 1:100){
  N.pred[n] <- predict(model.N,new.obs,offset=10)$N
  # insert estimate for N into data frame for it is used, not the original value
  new.obs$N.scale <- N.pred[n]/10
  S.pred[n] <- predict(model.S,new.obs,N.pred[n],offset=10)$S
}
hist(S.pred)



