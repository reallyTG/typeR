library(RAD)


### Name: truncMod
### Title: truncMod
### Aliases: truncMod
### Keywords: misc

### ** Examples

fish.data$N.scale <- fish.data$N/fish.data$area
S.form <- S~1 + N.scale + depth + O2_AV + temp_AV + offset(log(area))
model.S <- truncMod(S.form,fish.data$N,data=fish.data,est.var=TRUE,scale.covar=TRUE)
plot(model.S$fitted,model.S$residuals)
abline(h=0)



