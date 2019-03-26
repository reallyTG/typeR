library(RAD)


### Name: negBinMod
### Title: negBinMod
### Aliases: negBinMod
### Keywords: misc

### ** Examples

N.form <- N~1  + depth + O2_AV + temp_AV + offset(log(area))
model.N <- negBinMod(N.form,data=fish.data,est.var=TRUE,scale.covar =FALSE)
plot(model.N$fitted,model.N$residuals)
abline(h=0)



