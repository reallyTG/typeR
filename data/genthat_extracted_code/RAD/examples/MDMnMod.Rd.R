library(RAD)


### Name: MDMnMod
### Title: MDMnMod
### Aliases: MDMnMod
### Keywords: misc

### ** Examples

head(n.data)
## format for the data object
n.data$N.scale <- n.data$N/n.data$area
n.data$S.scale <- n.data$S/n.data$area
nij.form <- nij~1 + N.scale + S.scale  + depth + O2_AV + temp_AV
model.nij <- MDMnMod(nij.form, data=n.data, ID=n.data$i, dist="MDMn", scale.covar=TRUE, est.var=FALSE, calc.resid=TRUE, trace=TRUE)
plot(model.nij$fitted$nij,model.nij$residuals)
plot(log(model.nij$fitted$nij),model.nij$residuals)



