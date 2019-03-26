library(gam)


### Name: predict.Gam
### Title: Predict method for GAM fits
### Aliases: predict.Gam
### Keywords: models regression nonparametric smooth

### ** Examples

data(gam.data)
Gam.object <- gam(y ~ s(x,6) + z, data=gam.data)
predict(Gam.object) # extract the additive predictors
data(gam.newdata)
predict(Gam.object, gam.newdata, type="terms") 



